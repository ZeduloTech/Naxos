// Wrapper for the USB, SRAMs and Wishbone interface on Naxos chip
`default_nettype none

module naxos_usb_wrapper  #(
    parameter WB_ADR_WIDTH      = 32,
    parameter WB_DAT_WIDTH      = 32
) (
    `ifdef USE_POWER_PINS
    inout                       VDD,
    inout                       VSS,
    `endif
    input                       wb_clk_i,
    input                       wb_rst_i, 
    input                       wb_stb_i, 
    input                       wb_cyc_i, 
    input  [WB_ADR_WIDTH-1:0]   wb_adr_i,
    input  [WB_DAT_WIDTH-1:0]   wb_dat_i, 
    input                       wb_we_i,
    input  [WB_DAT_WIDTH/8-1:0] wb_sel_i,
    output [WB_DAT_WIDTH-1:0]   wb_dat_o,
    output                      wb_ack_o,

    output                      usb_dp_oe_o,
    output                      usb_dn_oe_o,
    output                      usb_dp_pullup_o,
    output                      usb_dn_pullup_o,
    output                      usb_diff_rx_en_o,
    output                      usb_diff_tx_o,
    output                      usb_dp_o,
    output                      usb_dn_o,
    input                       usb_dp_i,
    input                       usb_dn_i,
    input                       usb_diff_rx_i,
    input                       usb_sense_i
);

    wire rst_n = ~wb_rst_i;

    // 512
    wire sram_req, sram_we, sram_rvalid;
    wire [8:0] sram_addr;
    wire [31:0] sram_wdata, sram_wmask, sram_rdata;
    wire [1:0] sram_rerror;

    assign sram_rerror = 2'b00;    

    wire macro_cen, macro_gwen;
    wire [31:0] macro_wen;

    assign macro_cen = wb_rst_i; //~sram_req;
    assign macro_gwen = ~sram_we;
    assign macro_wen = ~sram_wmask;
    
    (* keep, dont_touch *) gf180mcu_ocd_ip_sram__sram512x8m8wm1 sram_0 (
    `ifdef USE_POWER_PINS
	.VDD(VDD), .VSS(VSS),
    `endif
	.CLK(wb_clk_i), .CEN(macro_cen), .GWEN(macro_gwen),
	.WEN(macro_wen[7:0]), .A(sram_addr), .D(sram_wdata[7:0]), .Q(sram_rdata[7:0])
    );

    (* keep, dont_touch *) gf180mcu_ocd_ip_sram__sram512x8m8wm1 sram_1 (
    `ifdef USE_POWER_PINS
	.VDD(VDD), .VSS(VSS),
    `endif
	.CLK(wb_clk_i), .CEN(macro_cen), .GWEN(macro_gwen),
	.WEN(macro_wen[15:8]), .A(sram_addr), .D(sram_wdata[15:8]), .Q(sram_rdata[15:8])
    );

   (* keep, dont_touch *) gf180mcu_ocd_ip_sram__sram512x8m8wm1 sram_2 (
    `ifdef USE_POWER_PINS
	.VDD(VDD), .VSS(VSS),
    `endif
	.CLK(wb_clk_i), .CEN(macro_cen), .GWEN(macro_gwen),
	.WEN(macro_wen[23:16]), .A(sram_addr), .D(sram_wdata[23:16]), .Q(sram_rdata[23:16])
    );

   (* keep, dont_touch *) gf180mcu_ocd_ip_sram__sram512x8m8wm1 sram_3 (
    `ifdef USE_POWER_PINS
	.VDD(VDD), .VSS(VSS),
    `endif
	.CLK(wb_clk_i), .CEN(macro_cen), .GWEN(macro_gwen),
	.WEN(macro_wen[31:24]), .A(sram_addr), .D(sram_wdata[31:24]), .Q(sram_rdata[31:24])
    );
     
    reg rvalid_q;
    always_ff @(posedge wb_clk_i or negedge rst_n) begin
	if(!rst_n) rvalid_q <= 1'b0;
        else rvalid_q <= sram_req & ~sram_we;
    end

    assign sram_rvalid = rvalid_q;
    // 512-end

    //USB
    // data output
    wire usbdev_tx_se0_o, usbdev_tx_use_d_se0_o;
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
        .clk_i                  (wb_clk_i), 
        .rst_ni                 (rst_n), 
        .clk_aon_i              (1'b0),
        .rst_aon_ni             (rst_n),

        // data inputs tied low
        .cio_usb_dp_i           (usb_dp_i),
        .cio_usb_dn_i           (usb_dn_i),
        .usb_rx_d_i             (usb_diff_rx_i),

        // data outputs
        .cio_usb_dp_o           (usb_dp_o),
        .cio_usb_dp_en_o        (usb_dp_oe_o),
        .cio_usb_dn_o           (usb_dn_o),
        .cio_usb_dn_en_o        (usb_dn_oe_o),
        .usb_tx_se0_o           (usbdev_tx_se0_o),
        .usb_tx_d_o             (usb_diff_tx_o),

        // Non-data I/O
        .cio_sense_i            (usb_sense_i),
        .usb_dp_pullup_o        (usb_dp_pullup_o),
        .usb_dn_pullup_o        (usb_dn_pullup_o),
        .usb_rx_enable_o        (usb_diff_rx_en_o),
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
    reg wb_ack_usb, wb_ack;
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

    assign cpu_req     = wb_stb_i && wb_cyc_i && !wb_ack;
    assign is_signal   = cpu_req && (wb_adr_i == 32'h3000_000C);
    assign is_usb_reg  = cpu_req && ((wb_adr_i >= USB_BASE)     && (wb_adr_i <= USB_REGS_END));
    assign is_usb_buf  = cpu_req && ((wb_adr_i >= USB_BUF_BASE) && (wb_adr_i <= USB_END));

    assign wb_dat_o =
          (wb_adr_i == 32'h3000_000C)                              ? signal_reg
        : (wb_adr_i >= USB_BUF_BASE && wb_adr_i <= USB_END)     ? sw_rdata_hold
        : (wb_adr_i >= USB_BASE     && wb_adr_i <= USB_REGS_END)? usb_rdata_hold
        : 32'h0;

    assign wb_ack_o = wb_ack;

    //==========================================================================
    // Signal register
    //==========================================================================
    always_ff @(posedge wb_clk_i) begin
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

        if (wb_stb_i && wb_cyc_i) begin
            if ((wb_adr_i >= USB_BASE) && (wb_adr_i <= USB_END)) begin
                usbdev_bus_addr = wb_adr_i[11:0];
                if (!wb_we_i) begin
                    usbdev_bus_re = !bus_re_sent;
                    usbdev_bus_be = 4'hF;
                end else begin
                    usbdev_bus_wdata = wb_dat_i;
                    usbdev_bus_we    = !bus_we_sent;
                    usbdev_bus_be    = wb_sel_i;
                end
            end
        end
    end

    // Hold registers — latched while the request is live; stable on ack cycle.
    always_ff @(posedge wb_clk_i or negedge rst_n) begin
        if (!rst_n) begin
            is_usb_buf_r_q <= 1'b0;
            usb_rdata_hold <= 32'h0;
            sw_rdata_hold  <= 32'h0;
            bus_re_sent    <= 1'b0;
            bus_we_sent    <= 1'b0;
        end else begin
            // Register the SRAM-read flag without !wb_ack_o so it persists
            is_usb_buf_r_q <= wb_stb_i && wb_cyc_i && !wb_we_i
                              && (wb_adr_i >= USB_BUF_BASE)
                              && (wb_adr_i <= USB_END);

            // bus_re_sent: set the cycle bus_re fires, clear when transaction ends.
            if (!wb_stb_i || !wb_cyc_i) begin
                bus_re_sent <= 1'b0;
            end else if (wb_stb_i && wb_cyc_i && !wb_we_i
                    && (wb_adr_i >= USB_BASE) && (wb_adr_i <= USB_END)
                    && !bus_re_sent) begin
                bus_re_sent <= 1'b1;
            end

            // bus_we_sent: set the cycle bus_we fires, clear when transaction ends.
            if (!wb_stb_i || !wb_cyc_i) begin
                bus_we_sent <= 1'b0;
            end else if (wb_stb_i && wb_cyc_i && wb_we_i
                     && (wb_adr_i >= USB_BASE) && (wb_adr_i <= USB_REGS_END)
                     && !bus_we_sent) begin
                bus_we_sent <= 1'b1;
            end

            // Latch USB register read data on the cycle bus_re fires.
            if (is_usb_reg && !wb_we_i && !bus_re_sent)begin
                usb_rdata_hold <= usbdev_bus_rdata;
            end

            // Latch SRAM read data whenever usbdev_sw_mem_a_rvalid pulses.
            if (usbdev_sw_mem_a_rvalid) begin
                sw_rdata_hold <= usbdev_sw_mem_a_rdata;
            end
        end
    end

    //==========================================================================
    // Wishbone ACK  — all registered to break combinatorial feedback loop
    //==========================================================================
    always_ff @(posedge wb_clk_i or negedge rst_n) begin
        if (!rst_n) begin
            wb_ack_usb <= 1'b0;
            wb_ack     <= 1'b0;
        end else begin
            wb_ack_usb <= is_usb_reg
                | (is_usb_buf && wb_we_i)
                | (is_usb_buf_r_q && usbdev_sw_mem_a_rvalid);

            wb_ack <= wb_ack_usb | is_signal;
        end
    end

endmodule
