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
    for (i=0; i<CNT_WDT; i++) begin : dly
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
    wire [DLY_LEN:0] pulse_dly;
    
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
    
    genvar i;
    generate
    for (i=0; i<DLY_LEN; i++) begin : dly
        (* keep, dont_touch *) gf180mcu_as_sc_mcu7t3v3__inv_2 inv (
            .A(pulse_dly[i]),
            .Y(pulse_dly[i+1])
        );
    end
    endgenerate

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
