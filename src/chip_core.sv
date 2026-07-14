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
    
    // USB
    wire usb_dp_oe;
    wire usb_dn_oe;
    wire usb_rx_en;
    
    // Ztimer
    wire ztimer_extpulse;
    wire ztimer_start;
    wire ztimer_stop;

    // #####################################################################
    // ############################# IO CONFIG #############################
    // #####################################################################

    // Set input pads to pull-down, no pull ups
    // ROSC_EN on input pad 1, off 
    assign input_pu = '0;
    assign input_pd = '1;

    // set pad config for flash & GPIO
    assign bidir_pu[`PAD_FLASH_IO1:`PAD_GPIO] = 5'b0010;
    assign bidir_pd[`PAD_FLASH_IO1:`PAD_GPIO] = 5'b0000;
    assign bidir_sl[`PAD_FLASH_IO1:`PAD_GPIO] = 5'b0000;
    assign bidir_cs[`PAD_FLASH_IO1:`PAD_GPIO] = 5'b0000;
    assign bidir_ie[`PAD_FLASH_CLK:`PAD_FLASH_CSB] = 2'b00;

    // set all other bidir configs between the Caravel & USB block to zero
    assign bidir_pu[`PAD_USB_START-1:`PAD_CARAVEL_END+1] = '0;
    assign bidir_pd[`PAD_USB_START-1:`PAD_CARAVEL_END+1] = '0;
    assign bidir_sl[`PAD_USB_START-1:`PAD_CARAVEL_END+1] = '0;
    assign bidir_cs[`PAD_USB_START-1:`PAD_CARAVEL_END+1] = '0;
    assign bidir_ie[`PAD_USB_START-1:`PAD_CARAVEL_END+1] = '0;
    assign bidir_oe[`PAD_USB_START-1:`PAD_CARAVEL_END+1] = '0;

    // USB pad config
    assign bidir_sl[`PAD_USB_END:`PAD_USB_START] = 4'b0000;
    assign bidir_cs[`PAD_USB_END:`PAD_USB_START] = 4'b0000;
    assign bidir_pd[`PAD_USB_END:`PAD_USB_START] = 4'b0000;

    // ztimer SPI pad config [CSB, SDI, SCK, SDO]
    assign bidir_pu[`PAD_ZTIMER_SPI_HI:`PAD_ZTIMER_SPI_LO] = 4'b1000; // CSB pull-up
    assign bidir_pd[`PAD_ZTIMER_SPI_HI:`PAD_ZTIMER_SPI_LO] = 4'b0110; // SCK & SDI pull-down
    assign bidir_sl[`PAD_ZTIMER_SPI_HI:`PAD_ZTIMER_SPI_LO] = 4'b0000; // fast slew
    assign bidir_cs[`PAD_ZTIMER_SPI_HI:`PAD_ZTIMER_SPI_LO] = 4'b1110; // Schmitt on 3 inputs
    assign bidir_ie[`PAD_ZTIMER_SPI_HI:`PAD_ZTIMER_SPI_LO] = 4'b1110; // inputs enabled
    assign bidir_oe[`PAD_ZTIMER_SPI_HI:`PAD_ZTIMER_SPI_LO] = 4'b0001; // SDO output enabled

    // bidir 39 to 38
    assign bidir_pu[`PAD_ZTIMER_BEGIN-1:`PAD_USB_END+1] = 2'b00;
    assign bidir_pd[`PAD_ZTIMER_BEGIN-1:`PAD_USB_END+1] = 2'b11;
    assign bidir_sl[`PAD_ZTIMER_BEGIN-1:`PAD_USB_END+1] = 2'b00;
    assign bidir_cs[`PAD_ZTIMER_BEGIN-1:`PAD_USB_END+1] = 2'b00;
    assign bidir_ie[`PAD_ZTIMER_BEGIN-1:`PAD_USB_END+1] = 2'b00;
    assign bidir_oe[`PAD_ZTIMER_BEGIN-1:`PAD_USB_END+1] = 2'b00;

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
        .OSC1(analog[`PADA_XTAL_OSC1]),
        .OSC2(analog[`PADA_XTAL_OSC2]),
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


   (* keep, dont_touch *) ztimer  u_ztimer (
        .clk_i         (core_clk),   // post-mux chip clock
        .rst_ni        (rst_n),

        // SPI slave
        .cio_sck_i     (bidir_in[`PAD_ZTIMER_SCK]),
        .cio_csb_i     (bidir_in[`PAD_ZTIMER_CSB]),
        .cio_sd_i      (bidir_in[`PAD_ZTIMER_SDI]),
        .cio_sd_o      (bidir_out[`PAD_ZTIMER_SDO]),

        // controls
        .extpulse      (ztimer_extpulse), 
        .start_i       (ztimer_start),
        .stop_i        (ztimer_stop)
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

        .usb_dp_oe_o      (usb_dp_oe),
        .usb_dn_oe_o      (usb_dn_oe),
        .usb_dp_pullup_o  (bidir_pu [`PAD_USB_DP]),
        .usb_dn_pullup_o  (bidir_pu [`PAD_USB_DN]),
        .usb_diff_rx_en_o (usb_rx_en),
        .usb_diff_tx_o    (bidir_out[`PAD_USB_DIFF_TX]),
        .usb_dp_o         (bidir_out[`PAD_USB_DP]),
        .usb_dn_o         (bidir_out[`PAD_USB_DN]),
        .usb_dp_i         (bidir_in [`PAD_USB_DP]),
        .usb_dn_i         (bidir_in [`PAD_USB_DN]),
        .usb_diff_rx_i    (bidir_in [`PAD_USB_DIFF_RX]),
        .usb_sense_i      (input_in [`PADI_USB_SENSE])
    );

    assign bidir_ie[`PAD_USB_DP] = ~usb_dp_oe;
    assign bidir_ie[`PAD_USB_DN] = ~usb_dn_oe;
    assign bidir_oe[`PAD_USB_DP] = usb_dp_oe;
    assign bidir_oe[`PAD_USB_DN] = usb_dn_oe;
    assign bidir_ie[`PAD_USB_DIFF_RX] = 1'b1;
    assign bidir_oe[`PAD_USB_DIFF_RX] = 1'b0;
    assign bidir_ie[`PAD_USB_DIFF_TX] = 1'b0;
    assign bidir_oe[`PAD_USB_DIFF_TX] = 1'b1;
    
    // Analog pad helpers, necessary for analog signals to be routed by OpenROAD
    apad_helper apad_helper_extpulse (
        .PAD(analog[`PADA_ZTIMER_EXTPULSE]),
        .SIG(ztimer_extpulse)
    );
    
    apad_helper apad_helper_start (
        .PAD(analog[`PADA_ZTIMER_START]),
        .SIG(ztimer_start)
    );
    
    apad_helper apad_helper_stop (
        .PAD(analog[`PADA_ZTIMER_STOP]),
        .SIG(ztimer_stop)
    );

endmodule
`default_nettype wire

