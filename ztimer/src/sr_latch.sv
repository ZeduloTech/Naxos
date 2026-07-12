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

    assign q = ~(r | qn);
    assign qn = ~(s | q);
    
endmodule
