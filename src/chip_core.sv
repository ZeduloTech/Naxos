// SPDX-License-Identifier: Apache-2.0

`timescale 1 ns / 1 ps
`default_nettype none
`include "pinout.vh"
`include "defines.v" // from Caravel

module chip_core #(
    parameter NUM_INPUT_PADS,
    parameter NUM_BIDIR_PADS,
    parameter NUM_ANALOG_PADS
    )(
    `ifdef USE_POWER_PINS
    inout  wire VDD,
    inout  wire VSS,
    `endif

    input  wire clk,       // clock
    input  wire rst_n,     // reset (active low)

    input  wire [NUM_INPUT_PADS-1:0] input_in,   // Input value
    output wire [NUM_INPUT_PADS-1:0] input_pu,   // Pull-up
    output wire [NUM_INPUT_PADS-1:0] input_pd,   // Pull-down

    input  wire [NUM_BIDIR_PADS-1:0] bidir_in,   // Input value
    output wire [NUM_BIDIR_PADS-1:0] bidir_out,  // Output value
    output wire [NUM_BIDIR_PADS-1:0] bidir_oe,   // Output enable
    output wire [NUM_BIDIR_PADS-1:0] bidir_cs,   // Input type (0=CMOS Buffer, 1=Schmitt Trigger)
    output wire [NUM_BIDIR_PADS-1:0] bidir_sl,   // Slew rate (0=fast, 1=slow)
    output wire [NUM_BIDIR_PADS-1:0] bidir_ie,   // Input enable
    output wire [NUM_BIDIR_PADS-1:0] bidir_pu,   // Pull-up
    output wire [NUM_BIDIR_PADS-1:0] bidir_pd,   // Pull-down
    inout  wire [NUM_ANALOG_PADS-1:0] analog  // Analog
);

    // #####################################################################
    // ############################### WIRES ###############################
    // #####################################################################

    // Clocks
    wire xtal_clk;
    wire core_clk;

    // Wishbone from Caravel
    wire user_wb_clk_prebuf;
    wire user_wb_clk;
    wire user_wb_rst;
    wire user_wb_cyc;
    wire user_wb_stb;
    wire user_wb_we;
    wire [3:0]  user_wb_sel;
    wire [31:0] user_wb_adr;
    wire [31:0] user_wb_dat_wr;
    wire [31:0] user_wb_dat_rd;
    wire user_wb_ack;
    // Additional Caravel signals
    wire npor;
    wire caravel_start_mode;

    // #####################################################################
    // ############################# IO CONFIG #############################
    // #####################################################################

    // Set input pads to pull-down
    // ztimer control inputs default LOW: ROSC off, no start, no stop
    assign input_pu = '0;
    assign input_pd = '1;

    // set pad config for flash & GPIO
    assign bidir_pu[`PAD_FLASH_IO1:`PAD_GPIO] = 5'b0010;
    assign bidir_pd[`PAD_FLASH_IO1:`PAD_GPIO] = 5'b0000;
    assign bidir_sl[`PAD_FLASH_IO1:`PAD_GPIO] = 5'b0000;
    assign bidir_cs[`PAD_FLASH_IO1:`PAD_GPIO] = 5'b0000;

    // set all other bidir configs between the Caravel & USB block to zero
    assign bidir_pu[`PAD_USB_START-1:`PAD_CARAVEL_END+1] = '0;
    assign bidir_pd[`PAD_USB_START-1:`PAD_CARAVEL_END+1] = '0;
    assign bidir_sl[`PAD_USB_START-1:`PAD_CARAVEL_END+1] = '0;
    assign bidir_cs[`PAD_USB_START-1:`PAD_CARAVEL_END+1] = '0;
    assign bidir_ie[`PAD_USB_START-1:`PAD_CARAVEL_END+1] = '0;
    assign bidir_oe[`PAD_USB_START-1:`PAD_CARAVEL_END+1] = '0;

    // USB pad config
    assign bidir_pu[`PAD_USB_END:`PAD_USB_TXD] = 2'b00;
    assign bidir_pd[`PAD_USB_END:`PAD_USB_TXD] = 2'b00;
    assign bidir_sl[`PAD_USB_END:`PAD_USB_TXD] = 2'b00;
    assign bidir_cs[`PAD_USB_END:`PAD_USB_TXD] = 2'b00;
    assign bidir_ie[`PAD_USB_END:`PAD_USB_TXD] = 2'b10;
    assign bidir_oe[`PAD_USB_END:`PAD_USB_TXD] = 2'b01;

    // ztimer SPI pad config (pads 18..21: SCK, CSB, SDI, SDO)
    assign bidir_pu[`PAD_ZTIMER_SDO:`PAD_ZTIMER_SCK] = 4'b0010; // CSB pull-up
    assign bidir_pd[`PAD_ZTIMER_SDO:`PAD_ZTIMER_SCK] = 4'b0000;
    assign bidir_sl[`PAD_ZTIMER_SDO:`PAD_ZTIMER_SCK] = 4'b0000;
    assign bidir_cs[`PAD_ZTIMER_SDO:`PAD_ZTIMER_SCK] = 4'b0000;
    assign bidir_ie[`PAD_ZTIMER_SDO:`PAD_ZTIMER_SCK] = 4'b0111;
    assign bidir_oe[`PAD_ZTIMER_SDO:`PAD_ZTIMER_SCK] = 4'b1000; // drive SDO only

    //!!!!!!!!!!!!!!!!!!!!!!!!
    // NO CONFIG FOR ZTIMER CONTROL PINS!
    //!!!!!!!!!!!!!!!!!!!!!!!!

    // Clock feedback pin
    assign bidir_pu[`PAD_SYS_CLK_FB] = 1'b0;
    assign bidir_pd[`PAD_SYS_CLK_FB] = 1'b0;
    assign bidir_sl[`PAD_SYS_CLK_FB] = 1'b0;
    assign bidir_cs[`PAD_SYS_CLK_FB] = 1'b0;
    assign bidir_ie[`PAD_SYS_CLK_FB] = 1'b0;
    assign bidir_oe[`PAD_SYS_CLK_FB] = 1'b1;


    // #####################################################################
    // ########################## CORE INSTANCES ###########################
    // #####################################################################

    // XTAL driver IP
    (* keep, dont_touch *) XTAL xtal_driver (
        .OSC1(analog[1]),
        .OSC2(analog[0]),
        .VCLOCK(xtal_clk)
    );
    assign bidir_out[`PAD_SYS_CLK_FB] = xtal_clk;

    // Clock input selector, 0 - CMOS, 1 - XTAL
    (* keep, dont_touch *) gf180mcu_as_sc_mcu7t3v3__mux2_4 clk_mux (
        .A(clk),
        .B(xtal_clk),
        .S(input_in[`PADI_SYS_CLKSEL]),
        .Y(core_clk)
    );

    // Buffer wb clock
    (* keep, dont_touch *) gf180mcu_as_sc_mcu7t3v3__clkbuff_8 wb_clk_buf (
        .A(user_wb_clk_prebuf),
        .Y(user_wb_clk)
    );

    caravel_core caravel (
        `ifdef USE_POWER_PINS
        .VDD(VDD),
        .VSS(VSS),
        `endif
        // SoC Core Interface
        .rstb(rst_n),
        .clock_core(core_clk),
        .gpio_out_core(bidir_out[`PAD_GPIO]),
        .gpio_in_core(bidir_in[`PAD_GPIO]),
        .gpio_outenb_core(bidir_oe[`PAD_GPIO]),
        .gpio_inenb_core(bidir_ie[`PAD_GPIO]),

        .flash_csb_frame(bidir_out[`PAD_FLASH_CSB]),
        .flash_clk_frame(bidir_out[`PAD_FLASH_CLK]),
        .flash_csb_oe(bidir_oe[`PAD_FLASH_CSB]),
        .flash_clk_oe(bidir_oe[`PAD_FLASH_CLK]),
        .flash_io0_oe(bidir_oe[`PAD_FLASH_IO0]),
        .flash_io1_oe(bidir_oe[`PAD_FLASH_IO1]),
        .flash_io0_ie(bidir_ie[`PAD_FLASH_IO0]),
        .flash_io1_ie(bidir_ie[`PAD_FLASH_IO1]),
        .flash_io0_do(bidir_out[`PAD_FLASH_IO0]),
        .flash_io1_do(bidir_out[`PAD_FLASH_IO1]),
        .flash_io0_di(bidir_in[`PAD_FLASH_IO0]),
        .flash_io1_di(bidir_in[`PAD_FLASH_IO1]),

        .caravel_io_in(bidir_in[`CARAVEL_IO_PADS-1:0]),
        .caravel_io_out(bidir_out[`CARAVEL_IO_PADS-1:0]),
        .caravel_io_oe(bidir_oe[`CARAVEL_IO_PADS-1:0]),
        .caravel_io_ie(bidir_ie[`CARAVEL_IO_PADS-1:0]),
        .caravel_io_schmitt_sel(bidir_cs[`CARAVEL_IO_PADS-1:0]),
        .caravel_io_pullup_sel(bidir_pu[`CARAVEL_IO_PADS-1:0]),
        .caravel_io_pulldown_sel(bidir_pd[`CARAVEL_IO_PADS-1:0]),
        .caravel_io_slew_sel(bidir_sl[`CARAVEL_IO_PADS-1:0]),

        // User wishbone stub
        .user_wb_clk_o(user_wb_clk_prebuf),
        .user_wb_rst_o(user_wb_rst),
        .user_wb_cyc_o(user_wb_cyc),
        .user_wb_stb_o(user_wb_stb),
        .user_wb_we_o (user_wb_we),
        .user_wb_sel_o(user_wb_sel),
        .user_wb_adr_o(user_wb_adr),
        .user_wb_dat_o(user_wb_dat_wr),
        .user_wb_dat_i(user_wb_dat_rd),
        .user_wb_ack_i(user_wb_ack),

        .user_irq_core(1'b0),

        // User IO stub
        .user_gpio_out({`CARAVEL_IO_PADS{1'b0}}),
        .user_gpio_oeb({`CARAVEL_IO_PADS{1'b1}}),

        .npor(npor),
        .start_mode(caravel_start_mode)
    );
    assign caravel_start_mode = 1'b0;

    //
    // ztimer 
    //
    (* keep, dont_touch *) rosc_spi_bridge  u_ztimer (
        .clk_i         (core_clk),   // post-mux chip clock
        .rst_ni        (rst_n),

        // SPI slave
        .cio_sck_i     (bidir_in [`PAD_ZTIMER_SCK]),
        .cio_csb_i     (bidir_in [`PAD_ZTIMER_CSB]),
        .cio_sd_i      (bidir_in [`PAD_ZTIMER_SDI]),
        .cio_sd_o      (bidir_out[`PAD_ZTIMER_SDO]),

        // controls 
        .rosc_enable_i (bidir_in [`PAD_ZTIMER_ROSC_EN]),
        .start_i       (bidir_in [`PAD_ZTIMER_START]),
        .stop_i        (bidir_in [`PAD_ZTIMER_STOP])
    );

    //
    // OpenTitan USB
    //
    naxos_usb_wrapper usb (
        `ifdef USE_POWER_PINS
        .VDD(VDD),
        .VSS(VSS),
        `endif
        .wb_clk_i(user_wb_clk),
        .wb_rst_i(user_wb_rst),
        .wb_stb_i(user_wb_stb),
        .wb_cyc_i(user_wb_cyc),
        .wb_adr_i(user_wb_adr),
        .wb_dat_i(user_wb_dat_wr),
        .wb_we_i (user_wb_we),
        .wb_sel_i(user_wb_sel),
        .wb_dat_o(user_wb_dat_rd),
        .wb_ack_o(user_wb_ack),

        .usb_tx_d_o(bidir_out[`PAD_USB_TXD]),
        .usb_rx_d_i(bidir_in[`PAD_USB_RXD])
    );

endmodule
`default_nettype wire

