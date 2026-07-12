/*
 * Copyright (c) 2026 Zedulo Sweden AB
 * SPDX-License-Identifier: Apache-2.0
 */
 
/**************************************************************************
//  The 8-bit command byte is decoded, then either;
//  MSB is 1 for READ, 0 for CLEAR.
//  Lower 4bits used for the register selection: cnt_idx[3:0]
//  READ (is_read[7]=1), latches the 32-bit register value, does MSB-first
//  CLEAR (is_read[7]=0), pulse signal to clear a particular register...
***************************************************************************/

module spi_core (
    input wire clk_i,
    input wire rst_ni,

    // interface to spi
    input wire [7:0] rx_data,
    input wire       rx_valid,
    output reg [7:0] tx_data,
    input wire       tx_load,
    input wire       cio_csb_syned,

    // interface to counters
    output reg [3:0] cnt_idx,
    output reg       cnt_rd_en,
    output reg       cnt_rst_en,
    input wire [31:0] cnt_val
);
    localparam STATE_IDLE = 0;
    localparam STATE_GET_CMD = 1;
    localparam STATE_READ_DATA = 2;
    localparam STATE_DONE = 3;

    reg [2:0] state;
    reg [1:0] byte_cnt;
    reg [31:0] data_latch; // 32-bit snapshot

    /////////////////////
    // Command decodeing
    ///////////////////
    wire [3:0] idx;
    wire        is_read;

    assign idx = rx_data[3:0];
    assign is_read = rx_data[7]; // 1 READ, 0 RESET

    always @(posedge clk_i or  negedge rst_ni) begin
        if (!rst_ni) begin
            state <= STATE_IDLE;
            byte_cnt <= 2'd0;
            cnt_idx <= 4'd0;
            cnt_rd_en <= 1'b0;
            cnt_rst_en <= 1'b0;
            tx_data <= 8'h00;
            data_latch <= 32'h0;
        end else if (cio_csb_syned) begin // clears on cs deasserts
            state <= STATE_IDLE;
            byte_cnt <= 2'd0;
            cnt_rd_en <= 1'b0;
            cnt_rst_en <= 1'b0;
            tx_data <= 8'h00;
        end else begin
            // pulses
            cnt_rd_en <= 1'b0;
            cnt_rst_en <= 1'b0;

            case (state)
                STATE_IDLE: begin
                    byte_cnt <= 2'd0;
                    state <= STATE_GET_CMD;
                end

                STATE_GET_CMD: begin
                    if (rx_valid) begin
                        cnt_idx <= idx;
                        if (is_read) begin
                            cnt_rd_en <= 1'b1;
                            state <= STATE_READ_DATA;
                        end else begin
                            cnt_rst_en <= 1'b1;
                            state <= STATE_DONE;
                        end 
                    end
                end

                STATE_READ_DATA: begin
                    if (cnt_rd_en) begin
                        data_latch <= cnt_val;
                        tx_data <= cnt_val[31:24]; //pre-load byte
                    end

                    if (tx_load) begin //updating tx_data only when tx_load igh
                        case (byte_cnt)
                            2'd0: tx_data <= data_latch[23:16];
                            2'd1: tx_data <= data_latch[15:8];
                            2'd2: tx_data <= data_latch[7:0];
                            default: ;
                        endcase
                    end

                    if (rx_valid) begin
                        if (byte_cnt == 2'd3) begin
                            state <= STATE_DONE;
                        end else begin
                            byte_cnt <= byte_cnt + 1'b1;
                        end
                    end
                end

                STATE_DONE:;            
                
                default: state <= STATE_IDLE;
            endcase
        end
    end
endmodule
