`timescale 1ps/1ps
`default_nettype none
/*
	1024 Words SRAM with byte enable
	Built out of 4 gf180_ram_1024x8_wrapper banks.
*/
module GF180_RAM_1024x32 (
        CLK,
        CEN,
        GWEN,
        WEN,
        A,
        D,
        Q,
	VDD,
	VSS
);
input           CLK;
input           CEN;    // Chip Enable (Active Low)
input           GWEN;   // Global Write Enable (Active Low)
input   [3:0]   WEN;    // Byte WEN (Active Low)
input   [9:0]   A;
input   [31:0]  D;
output  [31:0]  Q;
inout               VDD;
inout               VSS;

wire gwen_0 = ~(~GWEN);
wire [7:0] wen_0 = {8{WEN[0]}};
wire [7:0] wen_1 = {8{WEN[1]}};
wire [7:0] wen_2 = {8{WEN[2]}};
wire [7:0] wen_3 = {8{WEN[3]}};

gf180_ram_1024x8_wrapper RAM00 (
        .CLK(CLK), .CEN(CEN), .GWEN(gwen_0), .WEN(wen_0), .A(A[9:0]), .D(D[7:0]), .Q(Q[7:0])
);
gf180_ram_1024x8_wrapper RAM01 (
        .CLK(CLK), .CEN(CEN), .GWEN(gwen_0), .WEN(wen_1), .A(A[9:0]), .D(D[15:8]), .Q(Q[15:8])
);
gf180_ram_1024x8_wrapper RAM02 (
        .CLK(CLK), .CEN(CEN), .GWEN(gwen_0), .WEN(wen_2), .A(A[9:0]), .D(D[23:16]), .Q(Q[23:16])
);
gf180_ram_1024x8_wrapper RAM03 (
        .CLK(CLK), .CEN(CEN), .GWEN(gwen_0), .WEN(wen_3), .A(A[9:0]), .D(D[31:24]), .Q(Q[31:24])
);

endmodule
