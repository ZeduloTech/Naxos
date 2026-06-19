`timescale 1ns/1ps
module rosc_timer #(
    parameter integer N = 3	// number of not gates, must be odd & >= 3
)(
    input  wire rst_n,
    input  wire rosc_enable,
    input  wire clear,
    input  wire start,
    input  wire stop,
    output reg [31:0] debug_count,		// Debug count
    output reg [31:0] elapsed_count
);


`ifdef IVERILOG_SIMULATION	
	initial begin
		highcount = 0;
		lowcount = 0;
		debug_count = 0;
	end
`endif
    reg measuring;
    reg [3:0] lowcount;
    reg [27:0] highcount;
    wire ring_oscillator_out;
    wire [4:0] next_lowcount = lowcount + 1'b1; // Carry-out logic
    reg stop_prev; // To store the previous state of the stop signal
    
    reg stop_latch;
    reg measuring_prev;
    
    
    // Instantiate DUT
	not_rosc #(.N(N)) dut (    
		.rosc_enable(rosc_enable),			// Enable ring oscillator
		.ring_oscillator_out(ring_oscillator_out)		//ring oscillator out 
	);


always @(posedge ring_oscillator_out or negedge rst_n) begin
    if (!rst_n) begin
        measuring      <= 1'b0;
        measuring_prev <= 1'b0;
        elapsed_count  <= 32'd0;
        stop_prev      <= 1'b0;
        stop_latch     <= 1'b0;
    end else begin
        stop_prev      <= stop;
        measuring_prev <= measuring;
        stop_latch     <= 1'b0;

        if (clear) begin
            measuring      <= 1'b0;
            measuring_prev <= 1'b0;
            elapsed_count  <= 32'd0;
        end
        else if (start && !measuring) begin
            measuring <= 1'b1;
        end
        else if (stop && !stop_prev && measuring && measuring_prev) begin
            measuring  <= 1'b0;
            stop_latch <= 1'b1;
        end

        if (stop_latch)
            elapsed_count <= {highcount, lowcount};
    end
end


// Broken down counting with counting overflow 
	always @(posedge ring_oscillator_out) begin
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
	
		//LED driver
	always @(posedge lowcount) begin
		if (rst_n == 0 || clear == 1)
			debug_count <= 32'd0;
		else if (measuring == 1)
			debug_count <= debug_count + 1;
		else
			debug_count <= debug_count;
	end
	
endmodule
