module sram(
    `ifdef USE_POWER_PINS
    VDD,	 
    VSS,
    `endif
// Port 0: RW
    clk0,csb0,web0,wmask0,addr0,din0,dout0,
// Port 1: R
    clk1,csb1,addr1,dout1
);

    parameter   NUM_WMASKS  = 4 ;
    parameter   DATA_WIDTH  = 32 ;
    parameter   ADDR_WIDTH  = 11; //11 ; // block sel
    parameter   RAM_DEPTH   = 1 << ADDR_WIDTH;

    input                   clk0; // clock
    input                   csb0; // active low chip select
    input                   web0; // active low write control
    input [NUM_WMASKS-1:0]  wmask0; // write mask
    input [ADDR_WIDTH-1:0]  addr0;
    input [DATA_WIDTH-1:0]  din0;
    output [DATA_WIDTH-1:0] dout0;
    input                   clk1; // clock
    input                   csb1; // active low chip select
    input [ADDR_WIDTH-1:0]  addr1;
    output [DATA_WIDTH-1:0] dout1;
    `ifdef USE_POWER_PINS
    inout VDD;
    inout VSS;
    `endif

    /*
     * Expanding 4k SRAM to 8k
     * Introducing mux between the two blocks
    */

    wire sram_block = addr0[10]; // block selector
    wire csb0_00    =  csb0 | sram_block; // active when addr[10] is 0
    wire csb0_01    =  csb0 | ~sram_block; // active when addr[10] is 1

    wire [31:0] dout_00, dout_01;
    // Register for block selected mux read (output)
    reg sram_blk_out;
    always @(posedge clk0)
	if (!csb0) sram_blk_out <= sram_block;
 
    assign dout0 = sram_blk_out ? dout_01 : dout_00; 

    GF180_RAM_1024x32 ram1024x32_00 (    
                                    `ifdef USE_POWER_PINS
                                    .VDD(VDD), 
                                    .VSS(VSS),
                                    `endif
                                    .CLK(clk0), 
                                    .CEN(csb0_00),
                                    .GWEN(web0), 
                                    .WEN(~wmask0), 
                                    .A(addr0[9:0]), 
                                    .D(din0), 
                                    .Q(dout_00)
                                );

    GF180_RAM_1024x32 ram1024x32_01 (    
                                    `ifdef USE_POWER_PINS
                                    .VDD(VDD), 
                                    .VSS(VSS),
                                    `endif
                                    .CLK(clk0), 
                                    .CEN(csb0_01),
                                    .GWEN(web0), 
                                    .WEN(~wmask0), 
                                    .A(addr0[9:0]), 
                                    .D(din0), 
                                    .Q(dout_01)
                                );

endmodule
