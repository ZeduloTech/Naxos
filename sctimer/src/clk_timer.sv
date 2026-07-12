/*
 * Copyright (c) 2026 Zedulo Sweden AB
 * SPDX-License-Identifier: Apache-2.0
 */
/*********************************************************************
// This module takes an input clock, and acts as a timer
// It outputs an elapsed count corresponding to timed interval 
**********************************************************************/
`timescale 1ns/1ps
module clk_timer (
    input  wire clk_i,
    input  wire rst_n,
    input  wire clear,
    input  wire start,
    input  wire stop,
    output wire [31:0] debug_count,		// Debug count
    output reg [31:0] elapsed_count
);

	reg measuring;
	reg [3:0] lowcount;
	reg [27:0] highcount;

	assign debug_count = {highcount, lowcount};
    
	wire [4:0] next_lowcount = lowcount + 1'b1; // Carry-out logic
    reg stop_prev; // To store the previous state of the stop signal
	 
	
	// Start / stop control
    always @(posedge clk_i or negedge rst_n) begin
        if (!rst_n) begin
            measuring     <= 1'b0;
            elapsed_count <= 32'd0;
            stop_prev     <= 1'b0;
        end else begin
            // Store the current stop signal to compare on the next clock
            stop_prev <= stop;

            if (clear == 1) begin
                elapsed_count <= 32'd0;
            end 
            else if (start == 1 && measuring == 0) begin
                measuring <= 1'b1;
            end 
            // Only trigger when stop goes from 0 to 1 (Rising Edge)
            else if (stop == 1 && stop_prev == 0 && measuring == 1) begin
					measuring <= 1'b0;
					elapsed_count <= {highcount, lowcount};
				end
        end
    end
    

	 // Broken down counting with counting overflow 
	always @(posedge clk_i) begin
	    if (!rst_n || clear == 1) begin
	        lowcount <= 4'd0;
	        highcount <= 28'd0;
	    end else if (measuring == 1) begin
			lowcount <= next_lowcount[3:0]; // Take the bottom 4 bits

	      if (next_lowcount[4] == 1'b1) begin
				highcount <= highcount + 1;
			end

		end else begin
			lowcount <= lowcount;
			highcount <= highcount;
		end
	end

endmodule
