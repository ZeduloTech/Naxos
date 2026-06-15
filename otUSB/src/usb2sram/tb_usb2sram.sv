//
// TB for usb_sram_adapter
// Sweep, bit-mask, edge addresses, overwrite, rvalid timing.
//

`timescale 1ns / 1ps

module tb_usb2sram;

    localparam CLK_PERIOD = 10;

    reg         clk;
    reg         rst_n;
    reg         req;
    reg         we;
    reg  [9:0]  addr;
    reg  [7:0]  wdata;
    reg  [7:0]  wmask;
    wire [7:0]  rdata;
    wire        rvalid;
    wire [1:0] rerror;

    integer pass_count = 0;
    integer fail_count = 0;
    integer i;
    reg [7:0] expected;

    initial clk = 0;
    always #(CLK_PERIOD/2) clk = ~clk;

    usb2sram u_dut (
        .clk_i    (clk),
        .rst_ni   (rst_n),
        .ram_req_i    (req),
        .ram_we_i     (we),
        .ram_addr_i   (addr),
        .ram_wdata_i  (wdata),
        .ram_wmask_i  (wmask),
        .ram_rdata_o  (rdata),
        .ram_rvalid_o (rvalid),
	.ram_rerror_o (rerror)
    );

    task automatic mem_write(input [9:0] a, input [7:0] d, input [7:0] m);
        @(negedge clk);
        req = 1'b1; we = 1'b1; addr = a; wdata = d; wmask = m;
        @(negedge clk);
        req = 1'b0; we = 1'b0; wmask = 8'h00;
    endtask

    task automatic mem_read(input [9:0] a, output [7:0] d);
        @(negedge clk);
        req = 1'b1; we = 1'b0; addr = a;
        @(negedge clk);
        req = 1'b0;
        @(posedge clk);   // rvalid asserts here, rdata valid
        d = rdata;
        if (!rvalid) begin
            $display("  [FAIL] rvalid not asserted on read of 0x%03h", a);
            fail_count = fail_count + 1;
        end
    endtask

    task automatic verify(input string name, input [7:0] act, input [7:0] exp);
        if (act === exp) begin
            $display("  [PASS] %s = 0x%02h", name, act);
            pass_count = pass_count + 1;
        end else begin
            $display("  [FAIL] %s = 0x%02h (exp 0x%02h)", name, act, exp);
            fail_count = fail_count + 1;
        end
    endtask

    task init;
        rst_n = 0;
        req   = 0;
        we    = 0;
        addr  = 0;
        wdata = 0;
        wmask = 0;
    endtask

    reg [7:0] read_data;

    initial begin
        $dumpfile("tb_usb2sram.vcd");
        $dumpvars(0, tb_usb2sram);

        init();
        $display("");
        $display("** usb2sram Testbench **");
        $display("");

        repeat (20) @(posedge clk);
        rst_n = 1'b1;
        repeat (5)  @(posedge clk);

        // Sweep write/read, full mask
        $display("[TST] Sweep write");
        for (i = 0; i < 1024; i = i + 1) begin
            mem_write(i[9:0], (i[7:0]) ^ 8'hA5, 8'hFF);
        end
        $display("[TST] Sweep readback");
        for (i = 0; i < 1024; i = i + 1) begin
            mem_read(i[9:0], read_data);
            expected = (i[7:0]) ^ 8'hA5;
            if (read_data !== expected) begin
                $display("  [FAIL] addr=0x%03h got=0x%02h exp=0x%02h", i, read_data, expected);
                fail_count = fail_count + 1;
            end
        end
        if (fail_count == 0) begin
            $display("  [PASS] Full 1024-byte sweep");
            pass_count = pass_count + 1;
        end

        // Bit-mask test
        $display("[TST] Bit-mask writes");
        mem_write(10'h055, 8'hFF, 8'hFF);      // prime to 0xFF
        mem_write(10'h055, 8'h00, 8'h0F);      // clear low nibble only
        mem_read (10'h055, read_data);
        verify("mask low nibble", read_data, 8'hF0);

        mem_write(10'h056, 8'h00, 8'hFF);      // prime to 0x00
        mem_write(10'h056, 8'hFF, 8'b10101010); // set alternating bits
        mem_read (10'h056, read_data);
        verify("alternating mask", read_data, 8'b10101010);

        mem_write(10'h057, 8'h5A, 8'h00);      // zero mask = no write
        mem_read (10'h057, read_data);
        verify("zero mask preserves", read_data, 8'hF2);  // from sweep

        // ---- Edge addresses ----
        $display("[TST] Edge addresses");
        mem_write(10'h000, 8'hDE, 8'hFF); mem_read(10'h000, read_data);
        verify("addr 0x000", read_data, 8'hDE);
        mem_write(10'h3FF, 8'hAD, 8'hFF); mem_read(10'h3FF, read_data);
        verify("addr 0x3FF", read_data, 8'hAD);
        mem_write(10'h1FF, 8'hBE, 8'hFF); mem_read(10'h1FF, read_data);
        verify("addr 0x1FF", read_data, 8'hBE);
        mem_write(10'h200, 8'hEF, 8'hFF); mem_read(10'h200, read_data);
        verify("addr 0x200", read_data, 8'hEF);

        // ---- Overwrite ----
        $display("[TST] Overwrite");
        mem_write(10'h123, 8'h11, 8'hFF);
        mem_write(10'h123, 8'h22, 8'hFF);
        mem_read (10'h123, read_data);
        verify("overwrite 0x123", read_data, 8'h22);

        // Back-to-back writes to same address
        $display("[TST] Back-to-back writes");
        mem_write(10'h2AA, 8'h11, 8'hFF);
        mem_write(10'h2AA, 8'h22, 8'hFF);
        mem_write(10'h2AA, 8'h33, 8'hFF);
        mem_write(10'h2AA, 8'h44, 8'hFF);
        mem_read (10'h2AA, read_data);
        verify("Back-to-back", read_data, 8'h44);

        $display("");
        $display("** TEST COMPLETED **");
        $display("   PASS: %0d", pass_count);
        $display("   FAIL: %0d", fail_count);
        if (fail_count == 0) $display("   ALL TESTS PASSED !");
        else                 $display("   SOME TESTS FAILED *");

        $finish;
    end

endmodule
