`timescale 1 ns / 1 ps

module shrinking_tdc_tb #(
    parameter CNT_WDT   = 13,
    parameter DLY_LEN   = 1024
) ();

    reg rst_n;
    reg pulse_in;
    wire [CNT_WDT-1:0] count;

    shrinking_tdc #(
        .CNT_WDT(CNT_WDT),
        .DLY_LEN(DLY_LEN)
    ) tdc (
        .rst_n(rst_n),
        .pulse_in(pulse_in),
        .count(count)
    );
    
    initial begin
        $dumpfile("tdc.vcd");
        $dumpvars(0);
        rst_n <= 1'b0;
        pulse_in <= 1'b1;
        #100;
        rst_n <= 1'b1;
        #10;
        pulse_in <= 1'b0;
        #1;
        pulse_in <= 1'b1;
        #2000;
        rst_n <= 1'b0;
        #100;
        rst_n <= 1'b1;
        #10;
        pulse_in <= 1'b0;
        #2;
        pulse_in <= 1'b1;
        #5000;
        $finish;
    end

endmodule
