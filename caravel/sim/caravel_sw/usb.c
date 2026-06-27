#include <defs.h>

// ---------------------------------------------------------------------------
// Memory-mapped registers
// ---------------------------------------------------------------------------
#define USB_BASE        (0x30001000UL)
#define SRAM_BASE       (0x30001800UL)

#define USB_REG(off)    (*(volatile uint32_t*)(USB_BASE + (off)))

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

#define CONFIGIN_EP(n)   (0x44 + (n) * 4)
#define CONFIGIN_EP2     CONFIGIN_EP(2)   // 0x4C

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

#define SRAM_WORDS_PER_BUF  (16u)

#define USB_NOP()  ((void)USB_REG(USBSTAT))

// ---------------------------------------------------------------------------
// USB descriptors
// ---------------------------------------------------------------------------
#define USB_VID  (0xDEAD)
#define USB_PID  (0xCAFE)

static const uint8_t dev_descriptor[] = {
    18,         // bLength
    0x01,       // bDescriptorType: DEVICE
    0x00, 0x02, // bcdUSB: 2.00
    0x02,       // bDeviceClass: CDC
    0x00,       // bDeviceSubClass
    0x00,       // bDeviceProtocol
    64,         // bMaxPacketSize0
    (USB_VID & 0xFF), (USB_VID >> 8),
    (USB_PID & 0xFF), (USB_PID >> 8),
    0x00, 0x01, // bcdDevice: 1.00
    0x01,       // iManufacturer
    0x02,       // iProduct
    0x00,       // iSerialNumber
    0x01        // bNumConfigurations
};

#define CFG_TOTAL_LEN  67

static const uint8_t cfg_descriptor[] = {
    // Configuration descriptor (9 bytes)
    9, 0x02, CFG_TOTAL_LEN, 0x00, 0x02, 0x01, 0x00, 0x80, 50,
    // CDC Control Interface (9 bytes)
    9, 0x04, 0x00, 0x00, 0x01, 0x02, 0x02, 0x01, 0x00,
    // CDC Header Functional (5 bytes)
    5, 0x24, 0x00, 0x10, 0x01,
    // CDC ACM Functional (4 bytes)
    4, 0x24, 0x02, 0x02,
    // CDC Union Functional (5 bytes)
    5, 0x24, 0x06, 0x00, 0x01,
    // CDC Call Management Functional (5 bytes)
    5, 0x24, 0x01, 0x00, 0x01,
    // Notification EP1 IN (7 bytes)
    7, 0x05, 0x81, 0x03, 0x08, 0x00, 0xFF,
    // CDC Data Interface (9 bytes)
    9, 0x04, 0x01, 0x00, 0x02, 0x0A, 0x00, 0x00, 0x00,
    // Bulk EP2 IN (7 bytes)
    7, 0x05, 0x82, 0x02, 0x40, 0x00, 0x00,
    // Bulk EP3 OUT (7 bytes)
    7, 0x05, 0x03, 0x02, 0x40, 0x00, 0x00
};

// String index 0: language ID list
static const uint8_t str0_descriptor[] = {
    4, 0x03, 0x09, 0x04
};

// String index 1: Manufacturer = "Zedulo Zem Team, Maame"
static const uint8_t str1_descriptor[] = {
    46, 0x03,
    'Z',0, 'e',0, 'd',0, 'u',0, 'l',0, 'o',0, ' ',0,
    'Z',0, 'e',0, 'm',0, ' ',0, 'T',0, 'e',0, 'a',0, 'm',0, ',',0, ' ',0,
    'M',0, 'a',0, 'a',0, 'm',0, 'e',0
};

// String index 2: Product = "OpenTitan USB 2.0 Tweaked"
static const uint8_t str2_descriptor[] = {
    52, 0x03,
    'O',0, 'p',0, 'e',0, 'n',0, 'T',0, 'i',0, 't',0, 'a',0, 'n',0, ' ',0,
    'U',0, 'S',0, 'B',0, ' ',0, '2',0, '.',0, '0',0, ' ',0,
    'T',0, 'w',0, 'e',0, 'a',0, 'k',0, 'e',0, 'd',0
};

// ---------------------------------------------------------------------------
// UART helpers
// ---------------------------------------------------------------------------
#define uart_puts(...)
#define uart_crlf()
#define uart_hex8(...)
#define uart_hex32(...)

// ---------------------------------------------------------------------------
// SRAM helpers
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
                              + ((uint32_t)bufid    * 64u)
                              + ((uint32_t)word_idx *  4u));
    *p = val;
    USB_NOP();
}

// ---------------------------------------------------------------------------
// configin_arm — clear PEND then arm a CONFIGIN slot
//
// Must clear the PEND bit (bit 30) before every arm, otherwise the USB core
// silently ignores the new RDY write if a previous transaction was interrupted.
// ---------------------------------------------------------------------------
static inline void configin_arm(uint32_t reg_offset, uint8_t buf, uint8_t len)
{
    if (USB_REG(reg_offset) & (1u << 30)){
        USB_REG(reg_offset) = (1u << 30);
    }
    USB_NOP();
    USB_REG(reg_offset) = (1u << 31) | ((uint32_t)len << 8) | (uint32_t)buf;
    USB_NOP();
}

// ---------------------------------------------------------------------------
// send_ep0_in — arm CONFIGIN_0 with a ZLP or short status packet
// ---------------------------------------------------------------------------
void send_ep0_in(uint8_t len)
{
    configin_arm(CONFIGIN, BUF_IN_EP0, len);
    uart_puts("[EP0 IN] armed len="); uart_hex8(len); uart_crlf();
}

// ---------------------------------------------------------------------------
// send_descriptor — write descriptor into SRAM buf 4, then arm CONFIGIN_0
//
// Chunks into 64-byte packets. Clears PEND before each arm so a host
// re-enumeration or aborted transfer can never leave a stale PEND that
// causes subsequent RDY writes to be ignored.
// ---------------------------------------------------------------------------
void send_descriptor(const uint8_t *desc, uint8_t desc_len, uint16_t wLength)
{
    uint8_t send_len = (wLength == 0 || wLength > desc_len) ? desc_len
                                                             : (uint8_t)wLength;
    uint8_t offset = 0;

    while (offset < send_len) {
        uint8_t chunk = send_len - offset;
        if (chunk > 64u) chunk = 64u;

        // Write this chunk into SRAM before arming.
        uint8_t num_words = (chunk + 3u) / 4u;
        for (uint8_t w = 0; w < num_words; w++) {
            uint32_t word = 0;
            for (uint8_t b = 0; b < 4u; b++) {
                uint8_t idx = (uint8_t)(offset + w * 4u + b);
                if (idx < (offset + chunk) && idx < desc_len)
                    word |= ((uint32_t)desc[idx]) << (b * 8u);
            }
            sram_write_word(BUF_IN_EP0, w, word);
        }

        // Arm — clears PEND first, then sets RDY.
        configin_arm(CONFIGIN, BUF_IN_EP0, chunk);

        // Wait for the host to collect this chunk before sending the next.
        while (!(USB_REG(IN_SENT) & (1u << 0)));
        USB_REG(IN_SENT) = (1u << 0); USB_NOP();

        offset += chunk;
    }

    uart_puts("[DESC] sent="); uart_hex8(send_len);
    uart_puts(" desc_len="); uart_hex8(desc_len);
    uart_crlf();
}

// ---------------------------------------------------------------------------
// parse_payload + SETUP dispatcher
// ---------------------------------------------------------------------------
static void parse_payload(uint8_t bufid, uint8_t size, bool setup, uint8_t ep) __attribute__((section(".data")));
static void parse_payload(uint8_t bufid, uint8_t size, bool setup, uint8_t ep)
{
    uint8_t  num_words = (uint8_t)((size + 3u) / 4u);
    uint32_t word[16];

    for (uint8_t i = 0; i < 16u; i++) word[i] = 0u;
    for (uint8_t w = 0; w < num_words; w++)
        word[w] = sram_read_word(bufid, w);

    if (!setup || ep != 0) return;

    uint8_t  bmRequestType = (uint8_t)(word[0]);
    uint8_t  bRequest      = (uint8_t)(word[0] >>  8);
    uint8_t  wValueL       = (uint8_t)(word[0] >> 16); // string index / config value
    uint8_t  descType      = (uint8_t)(word[0] >> 24); // descriptor type
    uint16_t wLength       = (uint16_t)(word[1] >> 16);

    uart_puts("bmReqType="); uart_hex8(bmRequestType);
    uart_puts(" bReq=");     uart_hex8(bRequest);
    uart_puts(" wLen=");     uart_hex8((uint8_t)wLength);
    uart_crlf();

    if (bmRequestType == 0x80 && bRequest == 0x06) {
        // GET_DESCRIPTOR
        if (descType == 0x01) {
            uart_puts("[EP0] GET_DESCRIPTOR Device"); uart_crlf();
            send_descriptor(dev_descriptor, sizeof(dev_descriptor), wLength);

        } else if (descType == 0x02) {
            uart_puts("[EP0] GET_DESCRIPTOR Config"); uart_crlf();
            send_descriptor(cfg_descriptor, sizeof(cfg_descriptor), wLength);

        } else if (descType == 0x03) {
            uart_puts("[EP0] GET_DESCRIPTOR String idx="); uart_hex8(wValueL); uart_crlf();
            const uint8_t *str = 0;
            uint8_t str_len = 0;
            if      (wValueL == 0) { str = str0_descriptor; str_len = sizeof(str0_descriptor); }
            else if (wValueL == 1) { str = str1_descriptor; str_len = sizeof(str1_descriptor); }
            else if (wValueL == 2) { str = str2_descriptor; str_len = sizeof(str2_descriptor); }
            if (str) {
                send_descriptor(str, str_len, wLength);
            } else {
                USB_REG(IN_STALL)  = (1u << 0); USB_NOP();
                USB_REG(OUT_STALL) = (1u << 0); USB_NOP();
            }

        } else {
            uart_puts("[EP0] GET_DESCRIPTOR unknown="); uart_hex8(descType); uart_crlf();
            USB_REG(IN_STALL)  = (1u << 0); USB_NOP();
            USB_REG(OUT_STALL) = (1u << 0); USB_NOP();
        }

    } else if (bmRequestType == 0x00 && bRequest == 0x05) {
        uint8_t new_addr = wValueL;
        uart_puts("[EP0] SET_ADDRESS="); uart_hex8(new_addr); uart_crlf();
        send_ep0_in(0);
        while (!(USB_REG(IN_SENT) & (1u << 0)));
        USB_REG(IN_SENT) = (1u << 0); USB_NOP();
        // Address must not be updated until the ZLP IN is ACKed by the host.
        USB_REG(USBCTRL) = (1u << 0) | ((uint32_t)new_addr << 16);
        USB_NOP();
        uart_puts("[EP0] address updated="); uart_hex8(new_addr); uart_crlf();

    } else if (bmRequestType == 0x00 && bRequest == 0x09) {
        uart_puts("[EP0] SET_CONFIGURATION"); uart_crlf();
        send_ep0_in(0);

        // Enable EP0 + EP2 IN, EP0 + EP3 OUT for CDC loopback.
        USB_REG(EP_IN_ENABLE)  = (1u << 0) | (1u << 2); USB_NOP();
        USB_REG(EP_OUT_ENABLE) = (1u << 0) | (1u << 3); USB_NOP();
        USB_REG(RXENABLE_OUT)  = (1u << 0) | (1u << 3); USB_NOP();

    } else {
        uart_puts("[EP0] Unhandled bmReqType="); uart_hex8(bmRequestType);
        uart_puts(" bReq="); uart_hex8(bRequest); uart_crlf();
        USB_REG(IN_STALL)  = (1u << 0); USB_NOP();
        USB_REG(OUT_STALL) = (1u << 0); USB_NOP();
    }
}

// ---------------------------------------------------------------------------
// main
// ---------------------------------------------------------------------------
void main(void)
{
    reg_wb_enable = 1;

    uart_crlf();
    uart_puts("=== UART -> otUSB RXFIFO Polling (PicoRV32) ===");
    uart_crlf();

    USB_REG(AVSETUPBUFFER)   = BUF_SETUP_0; USB_NOP();
    USB_REG(AVSETUPBUFFER)   = BUF_SETUP_1; USB_NOP();
    USB_REG(AVOUTBUFFER)     = BUF_OUT_0;   USB_NOP();
    USB_REG(AVOUTBUFFER)     = BUF_OUT_1;   USB_NOP();
    USB_REG(EP_IN_ENABLE)    = (1u << 0);   USB_NOP();
    USB_REG(EP_OUT_ENABLE)   = (1u << 0);   USB_NOP();
    USB_REG(RXENABLE_SETUP)  = (1u << 0);   USB_NOP();
    USB_REG(RXENABLE_OUT)    = (1u << 0);   USB_NOP();
    USB_REG(OUT_STALL)       = 0;           USB_NOP();
    USB_REG(IN_STALL)        = 0;           USB_NOP();
    USB_REG(OUT_DATA_TOGGLE) = 0x003F0000;  USB_NOP();
    USB_REG(IN_DATA_TOGGLE)  = 0x003F0000;  USB_NOP();
    USB_REG(INTR_ENABLE)     = INTR_PKT_RECEIVED | INTR_PKT_SENT
                             | INTR_LINK_RESET   | INTR_SUSPEND
                             | INTR_FRAME        | INTR_POWERED;
    USB_NOP();
    USB_REG(USBCTRL) = 0x00000001; USB_NOP();

    uart_puts("USBSTAT= "); uart_hex32(USB_REG(USBSTAT)); uart_crlf();

    while (1) {
        //if (!(reg_rxfifo & 1u)) continue;

        uint32_t rxf   = USB_REG(RXFIFO);
        uint8_t  bufid = RXFIFO_BUFID(rxf);
        uint8_t  size  = RXFIFO_SIZE(rxf);
        uint8_t  ep    = RXFIFO_EP(rxf);
        bool     setup = RXFIFO_SETUP(rxf) != 0u;

        uart_crlf();
        uart_puts("> RXFIFO: "); uart_hex32(rxf);
        uart_puts("  BufId=");   uart_hex8(bufid);
        uart_puts("  Size=");    uart_hex8(size);
        uart_puts("  EP=");      uart_hex8(ep);
        uart_puts(setup ? "  SETUP" : "  OUT");
        uart_crlf();

        parse_payload(bufid, size, setup, ep);

        if (!setup && ep == 3 && size > 0) {
            uint8_t num_words = (size + 3u) / 4u;
            for (uint8_t w = 0; w < num_words; w++) {
                uint32_t val = sram_read_word(bufid, w);
                sram_write_word(BUF_EP2_IN, w, val);
            }
            // Arm EP2 IN — clear PEND first.
            configin_arm(CONFIGIN_EP2, BUF_EP2_IN, size);
        }

        if (setup) {
            USB_REG(AVSETUPBUFFER) = bufid; USB_NOP();
        } else {
            USB_REG(AVOUTBUFFER)   = bufid; USB_NOP();
        }
    }
}
