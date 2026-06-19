/*
 * This is a usb to sram direct port
 *
 *
 *
 */

`timescale 1ns / 1ps

module usb2sram (
`ifdef USE_POWER_PINS
    inout  wire VDD,
    inout  wire VSS,
`endif

    	input  logic clk_i,
    	input  logic rst_ni,

    	input  logic ram_req_i,
    	input  logic ram_we_i,
    	input  logic [9:0] ram_addr_i,
    	input  logic [7:0] ram_wdata_i,
    	input  logic [7:0] ram_wmask_i,
    	output logic [7:0] ram_rdata_o,
    	output logic ram_rvalid_o,
	output logic [1:0] ram_rerror_o
);

	// Active low conversion for macro
	logic macro_cen;
	logic macro_gwen;
	logic [7:0] macro_wen;	

	assign macro_cen = ~ram_req_i;
	assign macro_gwen = ~ram_we_i;
	assign macro_wen = ~ram_wmask_i;

`ifdef SYNTHESIS
	sram_1024_model u_sram (
		.CLK (clk_i),
		.CEN (macro_cen),
		.GWEN (macro_gwen),
		.WEN (macro_wen),
		.A (ram_addr_i),
		.D (ram_wdata_i),
		.Q (ram_rdata_o)
	);

`else
   (* keep, dont_touch *) gf180_ram_1024x8_wrapper u_sram_0 (
  	`ifdef USE_POWER_PINS
        	.VDD (VDD),
        	.VSS (VSS),
  	`endif
        	.CLK (clk_i),
        	.CEN (macro_cen),
        	.GWEN(macro_gwen),
        	.WEN (macro_wen),
        	.A   (ram_addr_i),
        	.D   (ram_wdata_i),
        	.Q   (ram_rdata_o)
    	);

`endif
	// 1 cycle read
	logic rvalid_q;
	always_ff @(posedge clk_i or negedge rst_ni) begin
		if(!rst_ni) rvalid_q <= 1'b0;
		else rvalid_q <= ram_req_i & ~ram_we_i;
	end
	
	assign ram_rvalid_o = rvalid_q;
 	assign ram_rerror_o = 2'b0;
endmodule
