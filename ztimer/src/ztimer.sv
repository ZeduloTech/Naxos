/*
 * Copyright (c) 2026 Zedulo Sweden AB
 * SPDX-License-Identifier: Apache-2.0
 */
/************************************************************************
// Integration of sctimer (psTDC), clk_timer to SPI interface to read 
// and clear register(s)
// For the clk_timer module: 
// When start is triggered, the timer begins to count
// Triggering stop, ends the timing session and stores the count value(s) 
// that corresponds to the elapsed count within the elapsed_time registers.

// It also instantiates a looped delay line, which shrinks (makes shorter in time) a 
// negative pulse each loop for a fixed amount, in our case around 30 ps.
// At one point of the loop, there is a counter, which counts a number of rising edges,
// effectively counting a number of loops that the pulse "survives" before being shrunk 
// to zero length. The delay value of the loop is around 48 ns in our case, so counter 
// increments once each 48 ns or so. Before the measurement, the loop should be "emptied"
// and the counter reset to zero by the active-low reset input. The reset signal duration
// should be no less than the loop delay and the next input signal could be applied no 
// earlier than 20 ns before reset deassertion.

// Criteria for the measurement completion is that the output counter has not changed 
// for at least 2 loop periods (100 ns).
// It also instantiates an SPI module that comes to read or clear the registers of 
// interest 
**************************************************************************/ 

// reduce duplication
`ifdef SIM
   `define TDC_USE sctimer	
`else
   `define TDC_USE shrinking_tdc
`endif

module ztimer #(
    parameter integer N_REGS = 5,
	parameter integer FLAT_COUNTER_REGISTERS = (N_REGS * 32)
)(
    input wire clk_i,
    input wire rst_ni,
    
    input wire cio_sck_i,
    input wire cio_csb_i,
    input wire cio_sd_i,
    output wire cio_sd_o,

    input wire start_i,
    input wire stop_i,
    input wire extpulse //to test sub-clock directly
);	 

    wire [31:0] t0_elapsed_time;
	 
    wire [FLAT_COUNTER_REGISTERS - 1:0] counters_i;
    wire [3:0] cnt_idx;
    wire cnt_rst_en;

    wire [12:0] sc_start_count;
    wire [12:0] sc_stop_count;
    wire [12:0] sc_cal_count;
    wire [12:0] sc_direct_count;
	 
    reg sc_start_clear_n;
    reg sc_stop_clear_n;
    reg sc_cal_clear_n;
    reg sc_direct_clear_n;
   
    
    always @(posedge clk_buffed or negedge rst_ni) begin
        if (!rst_ni) begin
            sc_start_clear_n  <= 1'b1;
            sc_stop_clear_n   <= 1'b1;
            sc_cal_clear_n    <= 1'b1;
            sc_direct_clear_n <= 1'b1;
        end else begin
            if (cnt_rst_en && (cnt_idx == 4'd1)) sc_start_clear_n  <= ~sc_start_clear_n;
            if (cnt_rst_en && (cnt_idx == 4'd2)) sc_stop_clear_n   <= ~sc_stop_clear_n;
            if (cnt_rst_en && (cnt_idx == 4'd3)) sc_cal_clear_n    <= ~sc_cal_clear_n;
            if (cnt_rst_en && (cnt_idx == 4'd4)) sc_direct_clear_n <= ~sc_direct_clear_n;
        end
    end
    
    assign counters_i[0 * 32 +: 32] = t0_elapsed_time;
    assign counters_i[1 * 32 +: 32] = {sc_start_clear_n, 18'h0, sc_start_count};  //subclock start
    assign counters_i[2 * 32 +: 32] = {sc_stop_clear_n, 18'h0, sc_stop_count};   //subclock stop
    assign counters_i[3 * 32 +: 32] = {sc_cal_clear_n, 18'h0, sc_cal_count};    //subclock calibration
    assign counters_i[4 * 32 +: 32] = {sc_direct_clear_n, 18'h0, sc_direct_count}; //direct subclock

    wire clk_buffed;
    (* keep, dont_touch *) gf180mcu_as_sc_mcu7t3v3__clkbuff_8 clk_buf (
	.A (clk_i),
	.Y (clk_buffed)
    );


//sub-clock from start input to next rising edge of clock
	wire sc_start_pulse;
	ss2p ss2p_start(
    .start(start_i), 
    .stop(clk_buffed),
    .rst_n(sc_start_clear_n),
    .pulse(sc_start_pulse)
    );

	(* keep, dont_touch *) `TDC_USE sc_start(
    .rst_n (sc_start_clear_n),
    .pulse_in(sc_start_pulse),
    .count(sc_start_count)
	 );

//sub-clock from stop input to next rising edge of clock
	wire sc_stop_pulse;
	ss2p ss2p_stop(
    .start(stop_i), 
    .stop(clk_buffed),
    .rst_n(sc_stop_clear_n),
    .pulse(sc_stop_pulse)
    );
	 
	(* keep, dont_touch *) `TDC_USE sc_stop(
    .rst_n (sc_stop_clear_n),
    .pulse_in(sc_stop_pulse),
    .count(sc_stop_count)
	 );

    //sub-clock calibration, measures time for half a clock period

    wire sc_cal_pulse;
	ss2p ss2p_cal(
    .start(clk_buffed), 
    .stop(~clk_buffed), 
    .rst_n(sc_cal_clear_n),
    .pulse(sc_cal_pulse)
    );

	(* keep, dont_touch *) `TDC_USE sc_cal(
    .rst_n (sc_cal_clear_n),
    .pulse_in(sc_cal_pulse),
    .count(sc_cal_count)
	 );
	 
    //sub-clock taking in external input
	(* keep, dont_touch *) `TDC_USE sc_direct(
    .rst_n (sc_direct_clear_n),
    .pulse_in(extpulse),
    .count(sc_direct_count)
	 );

	 clk_timer u_timer_xtal (
		  .clk_i         (clk_buffed),
		  .rst_n         (rst_ni),
		  .clear         (cnt_rst_en && (cnt_idx == 4'd0)),
		  .start         (start_i),
		  .stop          (stop_i),
		  .elapsed_count (t0_elapsed_time)
	);
	
	
    spi_device #(
	    .FLAT_COUNTER_REGISTERS (FLAT_COUNTER_REGISTERS),
	    .N_REGS (N_REGS)
	 ) spi_device (
        .clk_i      (clk_buffed),
        .rst_ni     (rst_ni),

        .cio_sck_i  (cio_sck_i),
        .cio_csb_i  (cio_csb_i),
        .cio_sd_i   (cio_sd_i),
        .cio_sd_o   (cio_sd_o),

        .counters_i (counters_i),
        .cnt_idx    (cnt_idx),
        .cnt_rst_en (cnt_rst_en)
    );

endmodule
