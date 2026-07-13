/*
 * Copyright (c) 2026 Zedulo Sweden AB
 * SPDX-License-Identifier: Apache-2.0
 */
 
//// Start / Stop conversion to pulse
//pulse output is by defaul high, start/stop are by default low.
//pulse goes low when start goes high, and then pulse goes high when stop goes high
//reset takes the circuit back to default values
 
 module ss2p(
    input wire start, 
    input wire stop,
    input wire rst_n,
    output wire pulse
);


    wire sr0_q;
    sr_latch sr0 (
        .s(start),
        .r(~rst_n),
        .q(sr0_q)
	);

    wire d0_q;
    d_latch d0 (
        .d(sr0_q),
        .r(~rst_n),
        .en(stop),
        .q(d0_q)
	);
	
	assign pulse = ~ (d0_q ^ sr0_q);
    
endmodule
