module apad_helper(
    inout PAD,
    inout SIG
);
`ifdef SIM
tran (PAD, SIG);
`endif
endmodule
