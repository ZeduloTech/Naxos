/*
 * Copyright (c) 2026 Zedulo Sweden AB
 * SPDX-License-Identifier: Apache-2.0
 */

module d_latch (
    input wire d,
    input wire r,
    input wire en,
    output reg q
);

    always @ (d or en or r) begin
        if (r) q <= 0;
        else if (en) q <= d;
    end

endmodule
