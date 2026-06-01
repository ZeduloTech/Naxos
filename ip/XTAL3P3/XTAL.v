module XTAL(
    `ifdef USE_POWER_PINS
    inout  wire VDD_XTAL,
    inout  wire VSS_XTAL,
    `endif
    inout  wire OSC1, 
    inout  wire OSC2, 
    output wire VCLOCK
);

endmodule
