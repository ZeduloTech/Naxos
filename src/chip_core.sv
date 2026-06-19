// SPDX-FileCopyrightText: © 2025 egorxe
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

    // Set input pads to pull-down
    // ztimer control inputs default LOW: ROSC off, no start, no stop
    assign input_pu = '0;
    assign input_pd = '1;

    // set pad config for flash & GPIO
    assign bidir_pu[`PAD_FLASH_IO1:`PAD_GPIO] = 5'b0010;
    assign bidir_pd[`PAD_FLASH_IO1:`PAD_GPIO] = 5'b0000;
    assign bidir_sl[`PAD_FLASH_IO1:`PAD_GPIO] = 5'b0000;
    assign bidir_cs[`PAD_FLASH_IO1:`PAD_GPIO] = 5'b0000;

    // ztimer SPI pad config (pads 18..21: SCK, CSB, SDI, SDO)
    assign bidir_pu[`PAD_ZTIMER_SDO:`PAD_ZTIMER_SCK] = 4'b0010; // CSB pull-up
    assign bidir_pd[`PAD_ZTIMER_SDO:`PAD_ZTIMER_SCK] = 4'b0000;
    assign bidir_sl[`PAD_ZTIMER_SDO:`PAD_ZTIMER_SCK] = 4'b0000;
    assign bidir_cs[`PAD_ZTIMER_SDO:`PAD_ZTIMER_SCK] = 4'b0000;
    assign bidir_ie[`PAD_ZTIMER_SDO:`PAD_ZTIMER_SCK] = 4'b0111;
    assign bidir_oe[`PAD_ZTIMER_SDO:`PAD_ZTIMER_SCK] = 4'b1000; // drive SDO only

    // set all other bidirs above the ztimer block to default zero
    assign bidir_pu[NUM_BIDIR_PADS-1:`PAD_ZTIMER_END+1] = '0;
    assign bidir_pd[NUM_BIDIR_PADS-1:`PAD_ZTIMER_END+1] = '0;
    assign bidir_sl[NUM_BIDIR_PADS-1:`PAD_ZTIMER_END+1] = '0;
    assign bidir_cs[NUM_BIDIR_PADS-1:`PAD_ZTIMER_END+1] = '0;
    assign bidir_ie[NUM_BIDIR_PADS-1:`PAD_ZTIMER_END+1] = '0;
    assign bidir_oe[NUM_BIDIR_PADS-1:`PAD_ZTIMER_END+1] = '0;

    // XTAL driver IP
    (* keep, dont_touch *) XTAL xtal_driver (
        .OSC1(analog[1]),
        .OSC2(analog[0]),
        .VCLOCK(xtal_clk)
    );

    // Clock input selector, 0 - CMOS, 1 - XTAL
    (* keep, dont_touch *) gf180mcu_as_sc_mcu7t3v3__mux2_4 clk_mux (
        .A(clk),
        .B(xtal_clk),
        .S(input_in[`PADI_SYS_CLKSEL]),
        .Y(core_clk)
    );

    wb_counter counter (
        .wb_clk_i(user_wb_clk),
        .wb_rst_i(user_wb_rst),
        .wb_stb_i(user_wb_stb),
        .wb_cyc_i(user_wb_cyc),
        .wb_adr_i(user_wb_adr),
        .wb_dat_i(user_wb_dat_wr),
        .wb_we_i (user_wb_we),
        .wb_dat_o(user_wb_dat_rd),
        .wb_ack_o(user_wb_ack)
    );

    // Buffer wb clock
    (* keep, dont_touch *) gf180mcu_as_sc_mcu7t3v3__clkbuff_8 wb_clk_buf (
        .A(user_wb_clk_prebuf),
        .Y(user_wb_clk)
    );

    // 1K SRAM
    logic [7:0] sram_1k_out;
    (* keep, dont_touch *) gf180_ram_1024x8_wrapper sram_1k (
        `ifdef USE_POWER_PINS
        .VDD(VDD),
        .VSS(VSS),
        `endif
        .CLK (clk),
        .CEN (1'b1),
        .GWEN(1'b0),
        .WEN (8'b0),
        .A   (10'b0),
        .D   (8'b0),
        .Q   (sram_1k_out)
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
        .clk_i         (core_clk),                          // post-mux chip clock
        .rst_ni        (rst_n),

        // SPI slave
        .cio_sck_i     (bidir_in [`PAD_ZTIMER_SCK]),
        .cio_csb_i     (bidir_in [`PAD_ZTIMER_CSB]),
        .cio_sd_i      (bidir_in [`PAD_ZTIMER_SDI]),
        .cio_sd_o      (bidir_out[`PAD_ZTIMER_SDO]),

        // controls 
        .rosc_enable_i (input_in [`PADI_ZTIMER_ROSC_EN]),
        .start_i       (input_in [`PADI_ZTIMER_START]),
        .stop_i        (input_in [`PADI_ZTIMER_STOP])
    );

    //
    // USB, No functional connection yet
    //
    // bus port tied off
    wire [49:0] usbdev_bus_i_tie;
    assign      usbdev_bus_i_tie = '0;
    wire [32:0] usbdev_bus_o;
    //
    //bus_reg_pkg::bus_reg_i_t usbdev_bus_i_tie;
    //assign usbdev_bus_i_tie = '0;
    // data output, and more
    wire        usbdev_dp_o, usbdev_dp_en_o;
    wire        usbdev_dn_o, usbdev_dn_en_o;
    wire        usbdev_tx_se0_o, usbdev_tx_d_o;
    wire        usbdev_dp_pullup_o, usbdev_dn_pullup_o;
    wire        usbdev_rx_enable_o, usbdev_tx_use_d_se0_o;
    wire        usbdev_aon_suspend_req_o, usbdev_aon_wake_ack_o;
    wire        usbdev_ref_val_o, usbdev_ref_pulse_o;
    wire        usbdev_rx_fifo_rvalid;
    //bus_reg_pkg::bus_reg_o_t usbdev_bus_o;
    // SRAM interface
    wire        usbdev_ram_req_o, usbdev_ram_we_o;
    wire [8:0]  usbdev_ram_addr_o;
    wire [31:0] usbdev_ram_wdata_o, usbdev_ram_wmask_o;
    // SW SRAM interface
    wire        usbdev_sw_mem_a_rvalid;
    wire [1:0]  usbdev_sw_mem_a_rerror;
    wire [31:0] usbdev_sw_mem_a_rdata;
    // Interrupts
    wire usbdev_intr_pkt_received, usbdev_intr_pkt_sent;
    wire usbdev_intr_powered, usbdev_intr_disconnected;
    wire usbdev_intr_host_lost, usbdev_intr_link_reset;
    wire usbdev_intr_link_suspend, usbdev_intr_link_resume;
    wire usbdev_intr_av_out_empty, usbdev_intr_rx_full;
    wire usbdev_intr_av_overflow, usbdev_intr_link_in_err;
    wire usbdev_intr_link_out_err, usbdev_intr_rx_crc_err;
    wire usbdev_intr_rx_pid_err, usbdev_intr_rx_bitstuff_err;
    wire usbdev_intr_frame, usbdev_intr_av_setup_empty;
    (* keep, dont_touch *) usbdev u_usbdev (
        .clk_i                  (clk), //0
        .rst_ni                 (rst_n), //1
        .clk_aon_i              (1'b0),
        .rst_aon_ni             (1'b1),
        // data inputs tied low
        .cio_usb_dp_i           (1'b1),
        .cio_usb_dn_i           (1'b1),
        .usb_rx_d_i             (1'b1),
        // data outputs
        .cio_usb_dp_o           (usbdev_dp_o),
        .cio_usb_dp_en_o        (usbdev_dp_en_o),
        .cio_usb_dn_o           (usbdev_dn_o),
        .cio_usb_dn_en_o        (usbdev_dn_en_o),
        .usb_tx_se0_o           (usbdev_tx_se0_o),
        .usb_tx_d_o             (usbdev_tx_d_o),
        // Non-data I/O
        .cio_sense_i            (1'b0),
        .usb_dp_pullup_o        (usbdev_dp_pullup_o),
        .usb_dn_pullup_o        (usbdev_dn_pullup_o),
        .usb_rx_enable_o        (usbdev_rx_enable_o),
        .usb_tx_use_d_se0_o     (usbdev_tx_use_d_se0_o),
        // AON pinmux
        .usb_aon_suspend_req_o  (usbdev_aon_suspend_req_o),
        .usb_aon_wake_ack_o     (usbdev_aon_wake_ack_o),
        .usb_aon_bus_reset_i    (1'b0),
        .usb_aon_sense_lost_i   (1'b0),
        .usb_aon_bus_not_idle_i (1'b0),
        .usb_aon_wake_detect_active_i (1'b0),
        // SOF reference
        .usb_ref_val_o          (usbdev_ref_val_o),
        .usb_ref_pulse_o        (usbdev_ref_pulse_o),
        // Register bus
        .bus_i                  (usbdev_bus_i_tie),
        .bus_o                  (usbdev_bus_o),
        // RX FIFO polling indicator
        .rx_fifo_rvalid         (usbdev_rx_fifo_rvalid),
        // SRAM interface, inputs tied of
        .ram_rdata_i            (32'h0),
        .ram_rvalid_i           (1'b0),
        .ram_rerror_i           (2'h0),
        .ram_req_o              (usbdev_ram_req_o),
        .ram_we_o               (usbdev_ram_we_o),
        .ram_addr_o             (usbdev_ram_addr_o),
        .ram_wdata_o            (usbdev_ram_wdata_o),
        .ram_wmask_o            (usbdev_ram_wmask_o),
        // SW SRAM read por
        .sw_mem_a_rvalid        (usbdev_sw_mem_a_rvalid),
        .sw_mem_a_rerror        (usbdev_sw_mem_a_rerror),
        .sw_mem_a_rdata         (usbdev_sw_mem_a_rdata),
        // Interrupts
        .intr_pkt_received_o    (usbdev_intr_pkt_received),
        .intr_pkt_sent_o        (usbdev_intr_pkt_sent),
        .intr_powered_o         (usbdev_intr_powered),
        .intr_disconnected_o    (usbdev_intr_disconnected),
        .intr_host_lost_o       (usbdev_intr_host_lost),
        .intr_link_reset_o      (usbdev_intr_link_reset),
        .intr_link_suspend_o    (usbdev_intr_link_suspend),
        .intr_link_resume_o     (usbdev_intr_link_resume),
        .intr_av_out_empty_o    (usbdev_intr_av_out_empty),
        .intr_rx_full_o         (usbdev_intr_rx_full),
        .intr_av_overflow_o     (usbdev_intr_av_overflow),
        .intr_link_in_err_o     (usbdev_intr_link_in_err),
        .intr_link_out_err_o    (usbdev_intr_link_out_err),
        .intr_rx_crc_err_o      (usbdev_intr_rx_crc_err),
        .intr_rx_pid_err_o      (usbdev_intr_rx_pid_err),
        .intr_rx_bitstuff_err_o (usbdev_intr_rx_bitstuff_err),
        .intr_frame_o           (usbdev_intr_frame),
        .intr_av_setup_empty_o  (usbdev_intr_av_setup_empty)
    );

endmodule
`default_nettype wire
