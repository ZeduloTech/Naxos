`timescale 1 ns / 1 ps

module XTAL(
    `ifdef USE_POWER_PINS
    inout  wire VDD_XTAL,
    inout  wire VSS_XTAL,
    `endif
    inout  wire OSC1, 
    inout  wire OSC2, 
    output wire VCLOCK
);

`ifdef SIM
reg clock = 0;
always #10.417 clock <= (clock === 1'b0);   // 48 MHz

assign VCLOCK = clock;
`endif

endmodule
