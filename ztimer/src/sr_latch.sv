/*
 * Copyright (c) 2026 Zedulo Sweden AB
 * SPDX-License-Identifier: Apache-2.0
 */

module sr_latch(
    input wire s, 
    input wire r,
    output wire q, 
    output wire qn
);

`ifdef GENERIC
    // generic implementation
    assign q = ~(r | qn);
    assign qn = ~(s | q);
`else
    // gf180mcu_as_sc_mcu7t3v3 cells implementation
    
    wire s_or_r;
    gf180mcu_as_sc_mcu7t3v3__dlxfp_2 latch(     // inverting D-latch
        .ENA(s_or_r),
        .D(r),
        .Q(q)
    );
    
    gf180mcu_as_sc_mcu7t3v3__or2_2 or_rs(
        .A(s),
        .B(r),
        .Y(s_or_r)
    );
    
    assign qn = 1'b0;   // not used

`endif
    
endmodule
