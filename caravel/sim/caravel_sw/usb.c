#include <defs.h>
#include <stdint.h>

// ---------------------------------------------------------------------------
// Memory-mapped registers
// ---------------------------------------------------------------------------
#define USB_BASE        (0x30001000UL)
#define SRAM_BASE       (0x30001800UL)
#define reg_rxfifo      (*(volatile uint32_t*)0x3000000C)

#define USB_REG(off)    (*(volatile uint32_t*)(USB_BASE + (off)))
#define USB_NOP()  ((void)USB_REG(USBSTAT))

// ---------------------------------------------------------------------------
// USB Register offsets
// ---------------------------------------------------------------------------
#define INTR_STATE       (0x00)
#define INTR_ENABLE      (0x04)
#define USBCTRL          (0x10)
#define EP_OUT_ENABLE    (0x14)
#define EP_IN_ENABLE     (0x18)
#define USBSTAT          (0x1C)
#define AVOUTBUFFER      (0x20)
#define AVSETUPBUFFER    (0x24)
#define RXFIFO           (0x28)
#define RXENABLE_SETUP   (0x2C)
#define RXENABLE_OUT     (0x30)
#define IN_SENT          (0x38)
#define OUT_STALL        (0x3C)
#define IN_STALL         (0x40)
#define CONFIGIN         (0x44)
#define OUT_DATA_TOGGLE  (0x7C)
#define IN_DATA_TOGGLE   (0x80)
#define PHY_CONFIG       (0x8C)

#define CONFIGIN_EP2  (0x44 + 2*4)  // = 0x4C

// ---------------------------------------------------------------------------
// INTR bits
// ---------------------------------------------------------------------------
#define INTR_PKT_RECEIVED  (1u << 0)
#define INTR_PKT_SENT      (1u << 1)
#define INTR_LINK_RESET    (1u << 4)
#define INTR_SUSPEND       (1u << 5)
#define INTR_FRAME         (1u << 14)
#define INTR_POWERED       (1u << 15)

// ---------------------------------------------------------------------------
// RXFIFO field extraction
// ---------------------------------------------------------------------------
#define RXFIFO_BUFID(x)   ((x) & 0x1Fu)
#define RXFIFO_SIZE(x)    (((x) >> 8)  & 0x7Fu)
#define RXFIFO_SETUP(x)   (((x) >> 19) & 0x1u)
#define RXFIFO_EP(x)      (((x) >> 20) & 0xFu)

// ---------------------------------------------------------------------------
// Buffer allocation
// ---------------------------------------------------------------------------
#define BUF_SETUP_0   (0)
#define BUF_SETUP_1   (1)
#define BUF_OUT_0     (2)
#define BUF_OUT_1     (3)
#define BUF_IN_EP0    (4)
#define BUF_EP2_IN    (5)   // buffer 5 for EP2 IN data
#define BUF_CFG       (6)

// ---------------------------------------------------------------------------
// USB device descriptor & Configuration
// ---------------------------------------------------------------------------
#define USB_VID  (0xDEAD)
#define USB_PID  (0xCAFE)

static const uint8_t dev_desc[18] = {
    18,                         // bLength
    0x01,                       // bDescriptorType = Device
    0x00, 0x02,                 // bcdUSB = 2.00
    0x00,                       // bDeviceClass
    0x00,                       // bDeviceSubClass
    0x00,                       // bDeviceProtocol
    0x40,                       // bMaxPacketSize0 = 64  ← change from 0x08
    (USB_VID & 0xFF), (USB_VID >> 8),
    (USB_PID & 0xFF), (USB_PID >> 8),
    0x00, 0x01,                 // bcdDevice = 1.00
    0x00,                       // iManufacturer
    0x00,                       // iProduct
    0x00,                       // iSerialNumber
    0x01                        // bNumConfigurations
};

static const uint8_t cfg_desc[18] = {
    // Configuration descriptor (9 bytes)
    0x09,        // bLength
    0x02,        // bDescriptorType = Configuration
    0x12, 0x00,  // wTotalLength = 18 (config + interface)
    0x01,        // bNumInterfaces = 1
    0x01,        // bConfigurationValue = 1
    0x00,        // iConfiguration
    0x80,        // bmAttributes = bus powered
    0x32,        // bMaxPower = 100mA
    // Interface descriptor (9 bytes)
    0x09,        // bLength
    0x04,        // bDescriptorType = Interface
    0x00,        // bInterfaceNumber = 0
    0x00,        // bAlternateSetting = 0
    0x00,        // bNumEndpoints = 0
    0xFF,        // bInterfaceClass = vendor
    0x00,        // bInterfaceSubClass
    0x00,        // bInterfaceProtocol
    0x00         // iInterface
};

// ---------------------------------------------------------------------------
// sram_read_word
// ---------------------------------------------------------------------------
static inline uint32_t sram_read_word(uint8_t bufid, uint8_t word_idx)
{
    volatile uint32_t *p =
        (volatile uint32_t *)(SRAM_BASE
                              + ((uint32_t)bufid    * 64u)
                              + ((uint32_t)word_idx *  4u));
    return *p;
}

static inline void sram_write_word(uint8_t bufid, uint8_t word_idx, uint32_t val)
{
    volatile uint32_t *p =
        (volatile uint32_t *)(SRAM_BASE
                              + ((uint32_t)bufid    * 64u)   // byte stride
                              + ((uint32_t)word_idx *  4u)); // byte stride
    *p = val;
    //USB_NOP();
}

// ---------------------------------------------------------------------------
// send_ep0_in
// ---------------------------------------------------------------------------
void send_ep0_in(uint8_t len, uint8_t buffer) __attribute__((section(".data")));
void send_ep0_in(uint8_t len, uint8_t buffer)
{
    // Arm CONFIGIN_0:  [31]=rdy  [14:8]=size  [4:0]=buffer
    USB_REG(CONFIGIN) = (1u << 31) | ((uint32_t)len << 8) | (uint32_t)buffer;
    USB_NOP();
}

void preset_sram(const uint8_t *data, uint8_t len, uint8_t buffer)
{
    if (len > 0) {
        uint8_t num_words = (uint8_t)((len + 3u) / 4u);
        for (uint8_t w = 0; w < num_words; w++) {
            uint32_t word = 0;
            for (uint8_t b = 0; b < 4u; b++) {
                uint8_t idx = (uint8_t)(w * 4u + b);
                if (idx < len) word |= ((uint32_t)data[idx]) << (b * 8u);
            }
            sram_write_word(buffer, w, word);
        }
    }
}

// ---------------------------------------------------------------------------
// print_payload + SETUP dispatcher
// ---------------------------------------------------------------------------
static void print_payload(uint8_t bufid, uint8_t setup, uint8_t ep) __attribute__((section(".data")));
static void print_payload(uint8_t bufid, uint8_t setup, uint8_t ep)
{
    uint32_t w0 = sram_read_word(bufid, 0);
    uint32_t w1 = sram_read_word(bufid, 1);

    // Step 3: dispatch SETUP requests — AFTER all SRAM reads are complete
    if (setup == 0u || ep != 0u) return;

    uint8_t  bmRequestType = (uint8_t)w0;
    uint8_t  bRequest      = (uint8_t)(w0 >>  8);
    uint8_t  wValue        = (uint8_t)(w0 >> 16);
    uint8_t  descType      = (uint8_t)(w0 >> 24);
    uint16_t wLength       = (uint16_t)(w1 >> 16);

    if (bmRequestType == 0x80 && bRequest == 0x06) {
        // GET_DESCRIPTOR
        USB_REG(IN_SENT) = (1u << 0);  USB_NOP();
        if (descType == 0x01) {
            // Device Descriptor
            uint8_t send_len = 18u;
            send_ep0_in(send_len, BUF_IN_EP0);
        } else if (descType == 0x02) {
            // Configuration descriptor
            uint8_t send_len = (wLength == 0 || wLength > 18u) ? 18u : (uint8_t)wLength;

            send_ep0_in(send_len, BUF_CFG);
        }
    } else if (bmRequestType == 0x00 && bRequest == 0x05) {
        uint8_t new_addr = wValue;

        // Clear any stale IN_SENT for EP0 before arming ZLP
        USB_REG(IN_SENT) = (1u << 0);  USB_NOP();

        // Send ZLP at current address
        send_ep0_in(0, BUF_IN_EP0);

        // Now spin waiting for the fresh IN_SENT
        while (!(USB_REG(IN_SENT) & (1u << 0)));

        // Safe to update address
        USB_REG(USBCTRL) = (1u << 0) | ((uint32_t)new_addr << 16);
        USB_NOP();
    } else if (bmRequestType == 0x00 && bRequest == 0x09) {
        // SET_CONFIGURATION — acknowledge with ZLP
        // Clear any stale IN_SENT for EP0 before arming ZLP
        USB_REG(IN_SENT) = (1u << 0);  USB_NOP();

        send_ep0_in(0, BUF_IN_EP0);
    }
}

// ---------------------------------------------------------------------------
// main
// ---------------------------------------------------------------------------
void main(void) __attribute__((section(".data")));
void main(void)
{
    reg_wb_enable = 1; //enable wishbone

    // Apply configuration  
    // reg_mprj_xfer = 1;  
    // while (reg_mprj_xfer == 1); 

    /* uart_crlf();
    uart_puts("=== UART -> otUSB RXFIFO Polling (Caravel) ===");
    uart_crlf(); */

    // ===== DEVICE INITIALISATION =====
    // 1. Enable device first so register writes take effect correctly
    USB_REG(USBCTRL)         = 0x00000001;  USB_NOP();

    //Enable Differential Receiver Use (if needed)
    // USB_REG(PHY_CONFIG)      = 0x00000003;  USB_NOP();

    // 2. Clear stalls and toggles
    USB_REG(OUT_STALL)       = 0;           USB_NOP();
    USB_REG(IN_STALL)        = 0;           USB_NOP();
    USB_REG(OUT_DATA_TOGGLE) = 0x003F0000;  USB_NOP();
    USB_REG(IN_DATA_TOGGLE)  = 0x003F0000;  USB_NOP();

    // 3. Enable endpoints
    USB_REG(EP_IN_ENABLE)    = (1u << 0);   USB_NOP();
    USB_REG(EP_OUT_ENABLE)   = (1u << 0);   USB_NOP();
    USB_REG(RXENABLE_SETUP)  = (1u << 0);   USB_NOP();
    USB_REG(RXENABLE_OUT)    = (1u << 0);   USB_NOP();

    // 4. Load available buffers AFTER endpoints are enabled
    USB_REG(AVSETUPBUFFER) = BUF_SETUP_0; USB_NOP();
    USB_REG(AVSETUPBUFFER) = BUF_SETUP_1; USB_NOP();
    USB_REG(AVOUTBUFFER)     = BUF_OUT_0;   USB_NOP();
    USB_REG(AVOUTBUFFER)     = BUF_OUT_1;   USB_NOP();

    // 5. Interrupts last
    USB_REG(INTR_ENABLE)     = INTR_PKT_RECEIVED | INTR_PKT_SENT
                            | INTR_LINK_RESET   | INTR_SUSPEND
                            | INTR_FRAME        | INTR_POWERED;
    USB_NOP();

    //preset sram with descriptor
    uint8_t send_len = 18u;
    preset_sram(dev_desc, send_len, BUF_IN_EP0);//device descriptor
    preset_sram(cfg_desc, send_len, BUF_CFG);//config descriptor

    //read back preset descriptor debug
    // for (uint8_t w = 0; w < 3u; w++) {
    //     uint32_t v = sram_read_word(BUF_IN_EP0, w);
    // }

    // for (uint8_t w = 0; w < 3u; w++) {
    //     uint32_t v = sram_read_word(BUF_CFG, w);
    // }

    uint32_t sig;
    while (1) {
        sig = reg_rxfifo;
        
        if (!(sig & 1u)) continue;

        uint32_t rxf   = USB_REG(RXFIFO);
        uint8_t  bufid = RXFIFO_BUFID(rxf);
        uint8_t  size  = RXFIFO_SIZE(rxf);
        uint8_t  ep    = RXFIFO_EP(rxf);
        uint8_t  setup = RXFIFO_SETUP(rxf);

        print_payload(bufid, setup, ep);

        // Return buffer to hardware
       /* if (setup != 0u) {
            USB_REG(AVSETUPBUFFER) = bufid; USB_NOP();
        } else {
            USB_REG(AVOUTBUFFER)   = bufid; USB_NOP();
        }*/
    }
}
