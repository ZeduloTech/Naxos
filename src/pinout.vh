// Pad assignment
// Please use PAD_x for bidir pads and PADI_x for input ones

`ifndef _PINOUT_VH
`define _PINOUT_VH


// System
`define PADI_SYS_CLKSEL 3
`define PAD_SYS_CLK_FB  45

// Caravel
`define PAD_CARAVELIO_0 0
`define PAD_GPIO        13
`define PAD_FLASH_CSB   14
`define PAD_FLASH_CLK   15
`define PAD_FLASH_IO0   16
`define PAD_FLASH_IO1   17
`define PAD_CARAVEL_END `PAD_FLASH_IO1

// USB
`define PAD_USB_START   `PAD_USB_DIFF_RX
`define PAD_USB_DIFF_RX 34
`define PAD_USB_DIFF_TX 35
`define PAD_USB_DP      36
`define PAD_USB_DN      37
`define PAD_USB_END     `PAD_USB_DN
`define PADI_USB_SENSE  2

// zTimer
`define PAD_ZTIMER_SDO        40 //MISO
`define PAD_ZTIMER_SCK        41 //SCK
`define PAD_ZTIMER_SDI        42 //MOSI
`define PAD_ZTIMER_CSB        43 //CS
`define PADI_ZTIMER_ROSC_EN   1 //Rosc enable
`define PAD_ZTIMER_START      44  //start_i
`define PADI_ZTIMER_EXTPULSE  1
`define PADI_ZTIMER_STOP      0
  // SPI, start, end markers
`define PAD_ZTIMER_SPI_LO    `PAD_ZTIMER_SDO
`define PAD_ZTIMER_SPI_HI    `PAD_ZTIMER_CSB
`define PAD_ZTIMER_BEGIN     `PAD_ZTIMER_SDO
`define PAD_ZTIMER_END       `PAD_ZTIMER_START

// I2C
// `define PAD_OT_LOW      33
// `define PAD_OT_I2CSDA   34
// `define PAD_OT_I2CSCL   35
// `define PAD_OT_HIGH     36



`endif
