`timescale 1ns/1ps
module not_rosc #(
    parameter integer N = 3     // number of not gates, must be odd & >= 3
)(
    input wire rosc_enable,			// Enable ring oscillator
	output wire rosc_out			//ring oscillator out 
);

  wire [N-1:0] inv_in;
  wire [N-1:0] inv_out;

  assign inv_in[0] = rosc_enable ? inv_out[N-1] : 1'b1;
  assign inv_in[N-1:1] = inv_out[N-2:0];

  assign rosc_out = inv_in[N-1];

  inverter inv[N-1:0] (
      .in (inv_in),
      .out(inv_out)
  );
    
endmodule

