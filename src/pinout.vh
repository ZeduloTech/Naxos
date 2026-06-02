// Pad assignment
// Please use PAD_x for bidir pads and PADI_x for input ones

`ifndef _PINOUT_VH
`define _PINOUT_VH

// Caravel
`define PAD_CARAVELIO_0 0
`define PAD_GPIO        13
`define PAD_FLASH_CSB   14
`define PAD_FLASH_CLK   15
`define PAD_FLASH_IO0   16
`define PAD_FLASH_IO1   17

`define PAD_CARAVEL_END `PAD_FLASH_IO1

// I2C
`define PAD_OT_LOW      33
`define PAD_OT_I2CSDA   34
`define PAD_OT_I2CSCL   35
`define PAD_OT_HIGH     36

// System
`define PADI_SYS_CLKSEL 3

`endif
