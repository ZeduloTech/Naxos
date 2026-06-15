/*
 *
 * Copyright 2026 Zedulo
 * 
 * This is behavoral mimic of gf180_ram_1024x8_wrapper ports
 * For emulation purposes
 *
 * Projec: 1KB SRAM
 * Author: 
 * Decription: Synthesiable Simulation Model
 */

`timescale 1ns / 1ps

module sram_1024_model (
	input logic CLK,
	input logic CEN, // chip enable, 0
	input logic GWEN, // global write enable
	input logic [7:0] WEN, //write enable
	input logic [9:0] A,
	input logic [7:0] D,
	output logic [7:0] Q
);

	logic [7:0] mem [1023:0];
	logic [7:0] q;

	always_ff @(posedge CLK) begin
		if(!CEN) begin
			if(!GWEN) begin // Bit-level write
				for(int i = 0; i < 8; i++) begin
					if(!WEN[i]) mem[A][i] <= D[i];
				end
			end else begin // Read
				q <= mem[A];
			end
		end
	end
	
	assign Q = q;
endmodule
