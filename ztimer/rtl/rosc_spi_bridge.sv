// rosc_spi_bridge

module rosc_spi_bridge #(
    parameter integer N = 3
)(
    input wire clk_i,
    input wire rst_ni,
    
    input wire cio_sck_i,
    input wire cio_csb_i,
    input wire cio_sd_i,
    output wire cio_sd_o,

    input  wire rosc_enable_i,
    input wire start_i,
    input  wire stop_i
);	 

    wire [31:0] t0_elapsed_time;
    wire [3:0]  cnt_idx;
    wire      cnt_rst_en;


    rosc_timer #(.N(N)) u_timer0 (
        .rst_n         (rst_ni),
        .rosc_enable   (rosc_enable_i),
        .clear         (cnt_rst_en && (cnt_idx == 4'd0)),
        .start         (start_i),
        .stop          (stop_i),
        .elapsed_count (t0_elapsed_time)
    );

   
    spi_device s_device (
        .clk_i      (clk_i),
        .rst_ni     (rst_ni),

        .cio_sck_i  (cio_sck_i),
        .cio_csb_i  (cio_csb_i),
        .cio_sd_i   (cio_sd_i),
        .cio_sd_o   (cio_sd_o),

        .counters_i (t0_elapsed_time),
        .cnt_idx    (cnt_idx),
        .cnt_rst_en (cnt_rst_en)
    );

endmodule
