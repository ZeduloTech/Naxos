
module gf180_ram_512x8_wrapper (
`ifdef USE_POWER_PINS
    inout  wire        VDD,
    inout  wire        VSS,
`endif
    input  wire        CLK,        // clock
    input  wire        CEN,        // chip enable, active LOW
    input  wire        GWEN,       // global write enable, active LOW
    input  wire [7:0]  WEN,        // per-bit write mask, active LOW
    input  wire [8:0]  A,          // 9-bit address (512 entries)
    input  wire [7:0]  D,          // 8-bit data in
    output wire [7:0]  Q           // 8-bit data out
);
endmodule
