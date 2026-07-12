`default_nettype none


module tt_um_ztimer_top (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,     //always 1 when the design is powered,so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);
	
//=======================================================
//  REG/WIRE/PARAMETER declarations
//=======================================================	

	parameter integer FLAT_COUNTER_REGISTERS = 64;
	// array for 16 elapsed registers
    wire [FLAT_COUNTER_REGISTERS - 1:0] counters_i;
    wire [1:0] cnt_idx;
    wire cnt_rst_en;
	
	
	
	reg [31:0] t0_elapsed_count;
	reg [31:0] t1_elapsed_count;


//=======================================================
//  Assignments
//=======================================================
   assign counters_i[31:0] =  t0_elapsed_count;
   assign counters_i[63:32] = t1_elapsed_count;
   assign uo_out[1] = rst_n;
   

//=======================================================
//  Instantiation
//=======================================================		

	rosc_timer #(3) not_timer0 (
		.rst_n			(rst_n),
		.rosc_enable	(ena), 
		.clear			(cnt_rst_en && (cnt_idx == 4'd0)),
		.start			(ui_in[3]),
		.stop			(ui_in[4]),
		.elapsed_count  (t0_elapsed_count)
		);
		
	rosc_timer #(5) not_timer1 (
		.rst_n			(rst_n),
		.rosc_enable	(ena), 
		.clear			(cnt_rst_en && (cnt_idx == 4'd1)),
		.start			(ui_in[5]),
		.stop			(ui_in[6]),
		.elapsed_count  (t1_elapsed_count)
		);
	
	
	spi_device s_device (
        .clk_i      (clk),
        .rst_ni     (rst_n),

        .cio_sck_i  (ui_in[0]),
        .cio_csb_i  (ui_in[1]),
        .cio_sd_i   (ui_in[2]),
        .cio_sd_o   (uo_out[0]),

        .counters_i (counters_i),
        .cnt_idx    (cnt_idx),
        .cnt_rst_en (cnt_rst_en)
    );
	
		
//=======================================================
//  Structural coding
//=======================================================

	assign uo_out[7:2] = 6'b0000_00;

	// List all unused inputs to prevent warnings
	wire _unused = &{ ui_in[7:5], uio_in[7:0] };
	
	assign uio_oe  = 8'b0000_0000;
    assign uio_out = 8'b0000_0000;
    
endmodule
