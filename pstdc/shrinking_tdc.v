`timescale 1 ns / 1 ps

`ifdef SIM
`ifdef SIM_FAST
`define INV_MULTIPLIER 8
`else
`define INV_MULTIPLIER 1
`endif

module inv_delay #(
    parameter MULT = 1
) (
    input  A,
    output reg Y
);

    always @(A) 
        if (MULT & 1)
            Y <= #(0.047*MULT) ~A;
        else
            Y <= #(0.047*MULT) A;

endmodule;
`endif

module ripple_counter #(
    parameter CNT_WDT   = 8
) (
    input   rst_n,
    input   clk,
    output  [CNT_WDT-1:0] count
);

    wire [CNT_WDT-1:0] Q;
    wire [CNT_WDT:0] ripple_clk;
    
    assign ripple_clk[0] = clk;
    
    genvar i;
    generate
    for (i=0; i<CNT_WDT; i=i+1) begin : stage
        (* keep, dont_touch *) gf180mcu_as_sc_mcu7t3v3__dfsrtp_2 dff (
            .CLK(ripple_clk[i]),
            .RN(rst_n),
            .SN(1),
            .D(ripple_clk[i+1]),
            .Q(Q[i])
        );
        
        (* keep, dont_touch *) gf180mcu_as_sc_mcu7t3v3__inv_2 inv (
            .A(Q[i]),
            .Y(ripple_clk[i+1])
        );
        
        (* keep, dont_touch *) gf180mcu_as_sc_mcu7t3v3__buff_4 Qbuf (
            .A(Q[i]),
            .Y(count[i])
        );
    end
    endgenerate

endmodule

module shrink_unit #(
    parameter DLY_LEN   = 32
) (
    input   rst_n,
    input   pulse_in,
    output  pulse_out
);

    wire to_start;
    `ifdef SIM
    reg [DLY_LEN:0] pulse_dly;
    `else
    wire [DLY_LEN:0] pulse_dly;
    `endif
    
    assign pulse_out = pulse_dly[DLY_LEN];
    
    (* keep, dont_touch *) gf180mcu_as_sc_mcu7t3v3__nand2_4 rst_nand (
        .A(rst_n),
        .B(pulse_dly[DLY_LEN]),
        .Y(to_start)
    );

    (* keep, dont_touch *) gf180mcu_as_sc_mcu7t3v3__nand2_4 start_nand (
        .A(pulse_in),
        .B(to_start),
        .Y(pulse_dly[0])
    );
    
    `ifndef SIM
    // Synthesys version
    genvar i;
    generate
    for (i=0; i<DLY_LEN; i++) begin : dly
        (* keep, dont_touch *) gf180mcu_as_sc_mcu7t3v3__inv_2 inv (
            .A(pulse_dly[i]),
            .Y(pulse_dly[i+1])
        );
    end
    endgenerate
    
    `else
    // Simulation version
    
    reg shrinked;
    
    always @(pulse_dly[0]) begin
        if (pulse_dly[0])
            shrinked <= #0.100 1'b1;
        else
            shrinked <= #0.070 1'b0;
    end;
    
    inv_delay dly0 (
        .A(shrinked),
        .Y(pulse_dly[1])
    );
        
    genvar i;
    generate
    for (i=1; i<`INV_MULTIPLIER; i=i+1) begin : dly1
        inv_delay inv (
            .A(pulse_dly[i]),
            .Y(pulse_dly[i+1])
        );
    end
    
    for (i=1; i<DLY_LEN/`INV_MULTIPLIER; i=i+1) begin : dly2
        inv_delay #(.MULT(`INV_MULTIPLIER)) inv (
            .A(pulse_dly[i*`INV_MULTIPLIER]),
            .Y(pulse_dly[(i+1)*`INV_MULTIPLIER])
        );
    end
    endgenerate
    `endif

endmodule

module shrinking_tdc #(
    parameter CNT_WDT   = 13,
    parameter DLY_LEN   = 1024
) (
    input   rst_n,
    input   pulse_in,
    output  [CNT_WDT-1:0] count
);

    wire pulse_out;

    shrink_unit #(
        .DLY_LEN(DLY_LEN)
    ) shrink (
        .rst_n(rst_n),
        .pulse_in(pulse_in),
        .pulse_out(pulse_out)
    );
    
    ripple_counter #(
        .CNT_WDT(CNT_WDT)
    ) counter (
        .clk(pulse_out),
        .rst_n(rst_n),
        .count(count)
    );

endmodule
