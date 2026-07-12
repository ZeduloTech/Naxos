// spi_byte_sm.sv
// this module shifts single-byte

module spi_byte_sm (
    input wire clk_i,
    input wire rst_ni,

    input wire cio_sck_i,
    input wire cio_csb_i,
    input wire cio_sd_i, //mosi
    output wire cio_sd_o, //miso

    input wire [7:0] tx_data, // byte to send
    output reg       tx_load,
    output reg [7:0] rx_data, // byte recieved
    output reg       rx_valid,

    output wire cio_csb_syned // synchronize cs
);
    //////////////////
    // Synchronizing 
    ///////////////
    reg [2:0] sck_sync;
    reg [2:0] cs_sync;
    reg [2:0] mosi_sync;

    always @(posedge clk_i or negedge rst_ni) begin
        if (!rst_ni) begin
            sck_sync <= 3'b0;
            cs_sync <= 3'b111;
            mosi_sync <= 3'b0;
        end else begin
            sck_sync <= {sck_sync[1:0], cio_sck_i};
            cs_sync <= {cs_sync[1:0], cio_csb_i};
            mosi_sync <= {mosi_sync[1:0], cio_sd_i};
        end
    end

    ///////////////////
    // Edge detection
    ////////////////
    wire sck_rising;
    wire sck_falling;
    wire csb_active;

    assign sck_rising = (sck_sync[2:1] == 2'b01);
    assign sck_falling = (sck_sync[2:1] == 2'b10);
    assign csb_active = ~cs_sync[2];
    assign cio_csb_syned = cs_sync[2]; // downstream used by core engine

    ////////////////
    // MISO gating
    /////////////
    reg miso_reg;
    assign cio_sd_o = csb_active ? miso_reg : 1'b0;

    /////////////////////////
    // Shift register logic
    //////////////////////
    reg [2:0] bit_cnt;
    reg [7:0] shift_reg_in;
    reg [7:0] shift_reg_out;

    always @(posedge clk_i or negedge rst_ni) begin
        if (!rst_ni) begin
            bit_cnt <= 3'd0;
            rx_valid <= 1'b0;
            tx_load <= 1'b0;
            rx_data <= 8'h00;
            miso_reg <= 1'b0;
            shift_reg_in <= 8'h00;
            shift_reg_out <= 8'h00;
        end else if(!csb_active) begin // clear when CS deasserts
            bit_cnt <= 3'd0;
            rx_valid <= 1'b0;
            tx_load <= 1'b0;
            shift_reg_in <= 8'h00;
            shift_reg_out <= tx_data;
            miso_reg <= tx_data[7]; // setup first bit
        end else begin
            rx_valid <= 1'b0;
            tx_load <= 1'b0;

            //////////////////
            // MOSI sampling
            ///////////////
            if (sck_rising) begin
                shift_reg_in <= {shift_reg_in[6:0], mosi_sync[2]};

                if (bit_cnt == 3'd7) begin
                    rx_data <= {shift_reg_in[6:0], mosi_sync[2]};
                    rx_valid <= 1'b1;
                    tx_load <= 1'b1;
                end
            end

            /////////////////
            // MISO shifting
            ///////////////
            if (sck_falling) begin
                if (bit_cnt == 3'd7) begin
                    bit_cnt <= 3'd0;
                    shift_reg_out <= tx_data;
                    miso_reg <= tx_data[7];
                end else begin
                    bit_cnt <= bit_cnt + 1'b1;
                    miso_reg <= shift_reg_out[6 - bit_cnt];
                end
            end
        end
    end
endmodule