/*
 * Copyright (c) 2024 Uri Shaked
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none (* keep_hierarchy *)
module inverter (
    input  wire in,
    output wire out
);

/*
`ifdef IVERILOG_SIMULATION
	initial begin
		force out = 0;
		#1;
		release out;
	end
`endif
*/

  assign  out = ~in;

endmodule
