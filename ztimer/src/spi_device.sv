// spi_device.sv
// wrapper for spi_core and spi_byte_sm
// and interface to counters

module spi_device ( 
	input wire clk_i,
    input wire rst_ni,

    // spi pins
    input wire cio_sck_i,
    input wire cio_csb_i,
    input wire cio_sd_i,
    output wire cio_sd_o,

    // interface to counter signals
    input wire [31:0] counters_i,
    output wire [3:0] cnt_idx,
    output wire     cnt_rst_en
);

    // signals
    wire [7:0] rx_data;
    wire [7:0] tx_data;
    wire        rx_valid;
    wire        tx_load;
    wire        cnt_rd_en;
    wire        cio_csb_syned;

    ///////////////////
    // Module instance
    /////////////////
    spi_byte_sm s_bit_banging (
        .clk_i      (clk_i),
        .rst_ni     (rst_ni),

        .cio_sck_i   (cio_sck_i),
        .cio_csb_i   (cio_csb_i),
        .cio_sd_i    (cio_sd_i),
        .cio_sd_o    (cio_sd_o),

        .tx_data     (tx_data),
        .tx_load     (tx_load),
        .rx_data      (rx_data),
        .rx_valid    (rx_valid),

        .cio_csb_syned (cio_csb_syned)
    );

    spi_core s_core (
        .clk_i      (clk_i),
        .rst_ni     (rst_ni),

        .tx_data     (tx_data),
        .tx_load     (tx_load),
        .rx_data      (rx_data),
        .rx_valid    (rx_valid),
        .cio_csb_syned (cio_csb_syned),

        .cnt_idx        (cnt_idx),
        .cnt_rd_en      (cnt_rd_en),
        .cnt_rst_en     (cnt_rst_en),
        .cnt_val        (counters_i)
    );

endmodule
