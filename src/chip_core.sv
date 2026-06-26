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
/*
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
*/
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
        .rosc_enable_i (input_in [`PADI_ZTIMER_ROSC_EN]),
        .start_i       (input_in [`PADI_ZTIMER_START]),
        .stop_i        (input_in [`PADI_ZTIMER_STOP])
    );

// 512
    wire sram_req, sram_we, sram_rvalid;
    wire [8:0] sram_addr;
    wire [31:0] sram_wdata, sram_wmask, sram_rdata;
    wire [1:0] sram_rerror;

    //assign sram_req = 1'b1;
    //assign sram_we = 1'b0;
    //assign sram_addr = 9'h00;
    //assign sram_wdata = 32'h00;
    //assign sram_wmask = 32'h00;
    assign sram_rerror = 2'b00;    

    wire macro_cen, macro_gwen;
    wire [31:0] macro_wen;

    assign macro_cen = ~sram_req;
    assign macro_gwen = ~sram_we;
    assign macro_wen = ~sram_wmask;
    
    (* keep, dont_touch *) gf180_ram_512x8_wrapper sram_0 (
    `ifdef USE_POWER_PINS
	.VDD(VDD), .VSS(VSS),
    `endif
	.CLK(core_clk), .CEN(macro_cen), .GWEN(macro_gwen),
	.WEN(macro_wen[7:0]), .A(sram_addr), .D(sram_wdata[7:0]), .Q(sram_rdata[7:0])
    );

    (* keep, dont_touch *) gf180_ram_512x8_wrapper sram_1 (
    `ifdef USE_POWER_PINS
	.VDD(VDD), .VSS(VSS),
    `endif
	.CLK(core_clk), .CEN(macro_cen), .GWEN(macro_gwen),
	.WEN(macro_wen[15:8]), .A(sram_addr), .D(sram_wdata[15:8]), .Q(sram_rdata[15:8])
    );

   (* keep, dont_touch *) gf180_ram_512x8_wrapper sram_2 (
    `ifdef USE_POWER_PINS
	.VDD(VDD), .VSS(VSS),
    `endif
	.CLK(core_clk), .CEN(macro_cen), .GWEN(macro_gwen),
	.WEN(macro_wen[23:16]), .A(sram_addr), .D(sram_wdata[23:16]), .Q(sram_rdata[23:16])
    );

   (* keep, dont_touch *) gf180_ram_512x8_wrapper sram_3 (
    `ifdef USE_POWER_PINS
	.VDD(VDD), .VSS(VSS),
    `endif
	.CLK(core_clk), .CEN(macro_cen), .GWEN(macro_gwen),
	.WEN(macro_wen[31:24]), .A(sram_addr), .D(sram_wdata[31:24]), .Q(sram_rdata[31:24])
    );
     
    reg rvalid_q;
    always_ff @(posedge core_clk or negedge rst_n) begin
	if(!rst_n) rvalid_q <= 1'b0;
        else rvalid_q <= sram_req & ~sram_we;
    end

    assign sram_rvalid = rvalid_q;
// 512-end

//USB
    // data output
    wire usbdev_dp_o, usbdev_dp_en_o;
    wire usbdev_dn_o, usbdev_dn_en_o;
    wire usbdev_tx_se0_o, usbdev_tx_d_o;
    wire usbdev_dp_pullup_o, usbdev_dn_pullup_o;
    wire usbdev_rx_enable_o, usbdev_tx_use_d_se0_o;
    wire usbdev_aon_suspend_req_o, usbdev_aon_wake_ack_o;
    wire usbdev_ref_val_o, usbdev_ref_pulse_o;
    wire usbdev_rx_fifo_rvalid;

    // usbdev_reg_top access
    logic usbdev_bus_we, usbdev_bus_re, usbdev_bus_error;
    logic [3:0]  usbdev_bus_be;
    logic [11:0] usbdev_bus_addr;
    logic [31:0] usbdev_bus_wdata;
    logic [31:0] usbdev_bus_rdata;

    // SW SRAM interface
    logic        usbdev_sw_mem_a_rvalid;
    logic [1:0]  usbdev_sw_mem_a_rerror;
    logic [31:0] usbdev_sw_mem_a_rdata;

    // Interrupts
    logic usbdev_intr_pkt_received, usbdev_intr_pkt_sent;
    logic usbdev_intr_powered, usbdev_intr_link_reset, usbdev_intr_frame;

    (* keep, dont_touch *) usbdev u_usbdev (
        .clk_i                  (clk), //0
        .rst_ni                 (rst_n), //1
        .clk_aon_i              (1'b0),
        .rst_aon_ni             (rst_n),

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
        .bus_we_i               (usbdev_bus_we),
        .bus_re_i               (usbdev_bus_re),
        .bus_addr_i             (usbdev_bus_addr),
        .bus_wdata_i            (usbdev_bus_wdata),
        .bus_be_i               (usbdev_bus_be),
        .bus_error_o            (usbdev_bus_error),
        .bus_rdata_o            (usbdev_bus_rdata),

        // RX FIFO
        .rx_fifo_rvalid         (usbdev_rx_fifo_rvalid),

        // SRAM interface
        .ram_rdata_i            (sram_rdata),
        .ram_rvalid_i           (sram_rvalid),
        .ram_rerror_i           (sram_rerror),
        .ram_req_o              (sram_req),
        .ram_we_o               (sram_we),
        .ram_addr_o             (sram_addr),
        .ram_wdata_o            (sram_wdata),
        .ram_wmask_o            (sram_wmask),

        // SW SRAM read por
        .sw_mem_a_rvalid_o      (usbdev_sw_mem_a_rvalid),
        .sw_mem_a_rerror_o      (usbdev_sw_mem_a_rerror),
        .sw_mem_a_rdata_o       (usbdev_sw_mem_a_rdata),

        // Interrupts
        .intr_pkt_received_o    (usbdev_intr_pkt_received),
        .intr_pkt_sent_o        (usbdev_intr_pkt_sent),
        .intr_powered_o         (usbdev_intr_powered),
        .intr_disconnected_o    (),
        .intr_host_lost_o       (),
        .intr_link_reset_o      (usbdev_intr_link_reset),
        .intr_link_suspend_o    (),
        .intr_link_resume_o     (),
        .intr_av_out_empty_o    (),
        .intr_rx_full_o         (),
        .intr_av_overflow_o     (),
        .intr_link_in_err_o     (),
        .intr_link_out_err_o    (),
        .intr_rx_crc_err_o      (),
        .intr_rx_pid_err_o      (),
        .intr_rx_bitstuff_err_o (),
        .intr_frame_o           (usbdev_intr_frame),
        .intr_av_setup_empty_o  ()
    );

    // Wishbone Interfacing
    wire cpu_req, is_signal, is_usb_reg, is_usb_buf;
    reg is_usb_buf_r_q; // registered: read request targeting USB_BUF region
    reg bus_re_sent;    // one-shot: suppresses bus_re after first pulse per WB transaction
    reg bus_we_sent;    // one-shot: suppresses bus_we after first pulse per WB transaction
    reg [31:0] signal_reg;
    reg [31:0] usb_rdata_hold; // captured bus_o.bus_rdata for register reads
    reg [31:0] sw_rdata_hold;  // captured sw_rdata for SRAM reads

    //==========================================================================
    //  Memory Map
    //  0x3000_000C                Signal register (interrupts)
    //  0x3000_1000 – 0x3000_17FF  USB registers   (usbdev_reg_top)
    //  0x3000_1800 – 0x3000_1FFF  Packet-buffer SRAM (SW read/write port)
    //==========================================================================
    localparam USB_BASE     = 32'h3000_1000;
    localparam USB_REGS_END = 32'h3000_17FF;
    localparam USB_BUF_BASE = 32'h3000_1800;
    localparam USB_END      = 32'h3000_1FFF;

    assign cpu_req     = user_wb_stb && user_wb_cyc && !user_wb_ack;
    assign is_signal   = cpu_req && (user_wb_adr == 32'h3000_000C);
    assign is_usb_reg  = cpu_req && ((user_wb_adr >= USB_BASE)     && (user_wb_adr <= USB_REGS_END));
    assign is_usb_buf  = cpu_req && ((user_wb_adr >= USB_BUF_BASE) && (user_wb_adr <= USB_END));

    assign user_wb_dat_rd =
          (user_wb_adr == 32'h3000_000C)                              ? signal_reg
        : (user_wb_adr >= USB_BUF_BASE && user_wb_adr <= USB_END)     ? sw_rdata_hold
        : (user_wb_adr >= USB_BASE     && user_wb_adr <= USB_REGS_END)? usb_rdata_hold
        : 32'h0;

    //assign user_wb_ack = is_usb_reg | (is_usb_buf && user_wb_we) | (is_usb_buf_r_q && sw_rvalid);
    assign user_wb_ack = is_usb_reg | (is_usb_buf && user_wb_we) | (is_usb_buf_r_q && usbdev_sw_mem_a_rvalid);


    //==========================================================================
    // Signal register
    //==========================================================================
    always_ff @(posedge core_clk) begin
        signal_reg <= {27'b0, usbdev_intr_powered, usbdev_intr_link_reset, usbdev_intr_frame, usbdev_intr_pkt_sent, usbdev_intr_pkt_received};
    end

    //==========================================================================
    // USB reg_top bus_i drive
    //==========================================================================
    always_comb begin
        usbdev_bus_we    = 1'b0;
        usbdev_bus_re    = 1'b0;
        usbdev_bus_addr  = 12'h0;
        usbdev_bus_wdata = 32'h0;
        usbdev_bus_be    = 4'hF;

        if (user_wb_stb && user_wb_cyc && !user_wb_ack) begin
            if ((user_wb_adr >= USB_BASE) && (user_wb_adr <= USB_END)) begin
                usbdev_bus_addr = user_wb_adr[11:0];
                if (!user_wb_we) begin
                    usbdev_bus_re = !bus_re_sent;
                    usbdev_bus_be = 4'hF;
                end else begin
                    usbdev_bus_wdata = user_wb_dat_wr;
                    usbdev_bus_we    = !bus_we_sent;
                    usbdev_bus_be    = user_wb_sel;
                end
            end
        end
    end

    // Hold registers — latched while the request is live; stable on ack cycle.
    always_ff @(posedge core_clk or negedge rst_n) begin
        if (!rst_n) begin
            is_usb_buf_r_q <= 1'b0;
            usb_rdata_hold <= 32'h0;
            sw_rdata_hold  <= 32'h0;
            bus_re_sent    <= 1'b0;
            bus_we_sent    <= 1'b0;
        end else begin
            // Register the SRAM-read flag without !user_wb_ack so it persists
            is_usb_buf_r_q <= user_wb_stb && user_wb_cyc
                              && !user_wb_we
                              && (user_wb_adr >= USB_BUF_BASE)
                              && (user_wb_adr <= USB_END);

            // bus_re_sent: set the cycle bus_re fires, clear when transaction ends.
            if (user_wb_ack || !user_wb_stb || !user_wb_cyc) begin
                bus_re_sent <= 1'b0;
            end else if (user_wb_stb && user_wb_cyc && !user_wb_we
                    && (user_wb_adr >= USB_BASE) && (user_wb_adr <= USB_END)
                    && !bus_re_sent) begin
                bus_re_sent <= 1'b1;
            end

            // bus_we_sent: set the cycle bus_we fires, clear when transaction ends.
            if (user_wb_ack || !user_wb_stb || !user_wb_cyc) begin
                bus_we_sent <= 1'b0;
            end else if (user_wb_stb && user_wb_cyc && user_wb_we
                     && (user_wb_adr >= USB_BASE) && (user_wb_adr <= USB_REGS_END)
                     && !bus_we_sent) begin
                bus_we_sent <= 1'b1;
            end

            // Latch USB register read data on the cycle bus_re fires.
            if (is_usb_reg && !user_wb_we && !bus_re_sent)begin
                usb_rdata_hold <= usbdev_bus_rdata;
            end

            // Latch SRAM read data whenever usbdev_sw_mem_a_rvalid pulses.
            if (usbdev_sw_mem_a_rvalid) begin
                sw_rdata_hold <= usbdev_sw_mem_a_rdata;
            end
        end
    end



endmodule
`default_nettype wire

