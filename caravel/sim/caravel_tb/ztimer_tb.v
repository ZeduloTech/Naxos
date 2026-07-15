// SPDX-FileCopyrightText:Zedulo
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

`default_nettype none

`timescale 1 ns / 1 ps

module ztimer_tb;
    reg clock;
    reg RSTB;
    reg power1;

    wire gpio;
    wire [37:0] mprj_io;
    wire flash_csb;
    wire flash_clk;
    wire flash_io0;
    wire flash_io1;
    wire uart_tx;
    reg uart_rx = 1'b1;

    reg test_success = 1'b0;

    assign uart_tx = mprj_io[6];
    assign mprj_io[5] = uart_rx;

    always #10.42 clock <= (clock === 1'b0);    // 48 MHz

    initial begin
        clock = 0;
    end

    initial begin
        $display("Wait for zTimer test to complete");
        wait((u_ztb.test_complete == 1'b1) && (u_ztb.fail_cnt == 0));
        test_success <= 1'b1;
        #100;
        $finish;
    end

    initial begin
        RSTB <= 1'b0;
        #1000;
        RSTB <= 1'b1;        // Release reset
        #2000;
    end

    initial begin        // Power-up sequence
        power1 <= 1'b0;
        #2000;
        power1 <= 1'b1;
    end

    // Timeout
    initial begin
        #1000000;
        $display("Monitor: Test zTimer Failed (timeout)");
        $finish;
    end

    wire VDD5V0;
    wire VSS;

    assign VDD5V0 = power1;
    assign VSS = 1'b0;

    assign mprj_io[3] = 1'b1;  // Force CSB high.
    assign mprj_io[0] = 1'b0;  // Disable debug mode

    caravel uut (
        `ifdef USE_POWER_PINS
        .VDD      (VDD5V0),
        .VSS      (VSS),
        `endif
        .clock      (clock),
        .gpio     (gpio),
        .mprj_io  (mprj_io),
        .flash_csb(flash_csb),
        .flash_clk(flash_clk),
        .flash_io0(flash_io0),
        .flash_io1(flash_io1),
        .resetb      (RSTB)
    );

    spiflash #(
        .FILENAME({`HEX_PREFIX, "uart.hex"})
    ) spiflash (
        .csb(flash_csb),
        .clk(flash_clk),
        .io0(flash_io0),
        .io1(flash_io1),
        .io2(),            // not used
        .io3()            // not used
    );

    //zTimer testbench
    ztimer_tb_wrapper u_ztb (
        .clk_i   (clock),
        .rst_n   (RSTB),

        .sck_o  (uut.bidir_pads[`PAD_ZTIMER_SCK]),
        .csb_o  (uut.bidir_pads[`PAD_ZTIMER_CSB]),
        .sdi_o  (uut.bidir_pads[`PAD_ZTIMER_SDI]),
    
        .sdo_i  (uut.bidir_pads[`PAD_ZTIMER_SDO]),

        .start_o(uut.analog_pads[`PADA_ZTIMER_START]),
        .stop_o (uut.analog_pads[`PADA_ZTIMER_STOP]),
        .extpulse_o (uut.analog_pads[`PADA_ZTIMER_EXTPULSE])
    );

endmodule
`default_nettype wire

module ztimer_tb_wrapper(
    input  wire clk_i,       // clock
    input  wire rst_n,     // reset (active low)

    output  logic sck_o,
    output  logic csb_o,
    output  logic sdi_o,

    input   logic sdo_i,

    output  logic start_o,
    output  logic stop_o,
    output  logic extpulse_o
);

    localparam SCK_PERIOD = 200;

    reg  rosc_enable_i;
    reg  extpulse;
    reg  [31:0] read_val;
    reg  [7:0]  rx_trash;       // For command byte responses (ignored)
    integer     pass_cnt, fail_cnt, test_num;

    // Expected init values
    reg [31:0] baseline_elapsed;

    reg test_complete = 1'b0;

    assign extpulse_o = ~extpulse;

    //=============================
    // Tasks
    //=============================
    task spi_init;
        sck_o = 0;
        csb_o = 1;
        sdi_o = 0;
        read_val = 32'h0;
        pass_cnt   = 0;
        fail_cnt = 0;
        test_num = 0;

        rosc_enable_i = 0;
        start_o = 0;
        stop_o = 0;
        baseline_elapsed = 32'h0;
    endtask

    task spi_send_byte(input [7:0] tx, output [7:0] rx);
        integer index;
        begin
            for (index = 7; index >= 0; index = index - 1) begin
                sdi_o = tx[index];
                #(SCK_PERIOD / 2)  sck_o = 1;   // sample on rsing edge   
                #(SCK_PERIOD / 4)  rx[index] = sdo_i; // falling edge
                #(SCK_PERIOD / 4)  sck_o = 0;
            end
            #(SCK_PERIOD / 4); // Inter-byte gap
        end
    endtask

    // ///////////////////////////////////////////////////////////////
    // SPI Read Transaction: cmd(0x80|idx), receive 4 data bytes
    //////////////////////////////////////////////////////////////
    task spi_read_register(input [3:0] idx, output [31:0] data);
        begin
            csb_o = 0;
            #100; // CS setup time
            spi_send_byte(8'h80 | {4'h0, idx}, rx_trash);  // Command byte
            spi_send_byte(8'h00, data[31:24]);              // Data byte 3 (MSB)
            spi_send_byte(8'h00, data[23:16]);              // Data byte 2
            spi_send_byte(8'h00, data[15:8]);               // Data byte 1
            spi_send_byte(8'h00, data[7:0]);                // Data byte 0 (LSB)
            #50;
            csb_o = 1;
            #200; // CS deassert gap
        end
    endtask

    /////////////////////////////////////////
    // SPI Reset Transaction: cmd(0x00|idx)
    //////////////////////////////////////
    task spi_reset_register(input [3:0] idx);
        begin
            csb_o = 0;
            #100;
            spi_send_byte(8'h00 | {4'h0, idx}, rx_trash);  // Reset command
            repeat(10) @(posedge clk_i);
            #50;
            csb_o = 1;
            #200;
        end
    endtask

    //////////////////////////////
    // Check Readback to Expected 
    ////////////////////////////
    task inspect(input [31:0] actual, input [31:0] exp, input [127:0] test_name);
        begin
            test_num = test_num + 1;
            if (actual === exp) begin
                pass_cnt = pass_cnt + 1;
                $display("[PASS] Test %0d: %0s — got 0x%08h", test_num, test_name, actual);
            end else begin
                fail_cnt = fail_cnt + 1;
                $display("[FAIL] Test %0d: %0s — expected 0x%08h, got 0x%08h",
                         test_num, test_name, exp, actual);
            end
        end
    endtask

    task read_all_reg_elapsed;
        integer index;
        begin
            // Read T0 as baseline
            spi_read_register(4'h0, baseline_elapsed);
            $display("[INFO] T0 baseline elapsed = 0x%08h \n", baseline_elapsed);

            for (index = 0; index < 5; index = index + 1) begin
                spi_read_register(index[3:0], read_val);
                $display("[INFO] Checking register T%0d...", index);
                inspect(read_val, read_val, "TO baseline"); //c
            end
        end
    endtask

    task timer_rosc;
        begin
            $display("[INFO] Timer: reset asserted");
            rosc_enable_i = 0;
            start_o = 0;
            stop_o  = 0;
            extpulse = 0;
            #50;

            $display("[INFO] Timer: reset deasserted, rosc_enable asserted");
            rosc_enable_i = 1;
            #100;

            $display("[INFO] Timer: start pulse");
            start_o = 1;
            extpulse = 1;
            #20;
            start_o = 0;
            extpulse = 0;

            $display("[INFO] Timer: measuring window (2000 ns)");
            #2000;

            $display("[INFO] Timer: stop pulse");
            stop_o = 1;
            #20;
            stop_o = 0;

            #200;
            $display("[INFO] Timer: DONE");
        end
    endtask

    ///////////////////////
    // Main Test Sequence
    ////////////////////
    initial begin
        $dumpfile("ztimer_tb.vcd");
        $dumpvars(0, ztimer_tb);

        wait(!rst_n);
        $display("\n/////////////////////");
        $display(" Reset");
        $display("////////////////////");
        #100;

        // Initialize
        spi_init();

        wait(rst_n);
        $display("[INFO] Reset deasserted");
        spi_reset_register(4'h1);
        spi_reset_register(4'h2);
        spi_reset_register(4'h3);
        spi_reset_register(4'h4);
        #200;

        // not_rosc_timer
        $display("\n////////////////////////////////////");
        $display(" not_rosc_timer");
        $display("////////////////////////////////////");
        timer_rosc();
        #200;
        //timer_rosc();
        // Read ALL 16 registers
        $display("\n////////////////////////////////////");
        $display(" Read all 16 registers, default");
        $display("////////////////////////////////////");
        read_all_reg_elapsed();

        // Reset register and verify
        $display("\n////////////////////////");
        $display(" Reset and verify");
        $display("//////////////////////");
        spi_reset_register(4'h1);
        spi_reset_register(4'h2);
        spi_reset_register(4'h3);
        spi_reset_register(4'h4);
        // spi_reset_register(4'h0);
        // #500;
        // spi_read_register(4'h0, read_val);
        // inspect(read_val, 32'h0, "T0 after reset");
        #1000;
        spi_reset_register(4'h1);
        spi_reset_register(4'h2);
        spi_reset_register(4'h3);
        spi_reset_register(4'h4);
        

        // // Verify T1 is NOT affected by T0 reset
        // spi_read_register(4'h1, read_val);
        // inspect(read_val, expected[1], "T1 unaffected");
        
        spi_read_register(4'h0, read_val);
        // inspect(read_val, expected[1], "T1 DATA");
        $display("VALE: 0x%08h, Decimal: %0d", read_val, read_val);
        
        spi_reset_register(4'h0);
        #1000;
        spi_reset_register(4'h1);
        spi_reset_register(4'h2);
        spi_reset_register(4'h3);
        spi_reset_register(4'h4);
        #1000;
        spi_reset_register(4'h1);
        spi_reset_register(4'h2);
        spi_reset_register(4'h3);
        spi_reset_register(4'h4);
        #1000;
        
        spi_read_register(4'h0, read_val);
        inspect(read_val, 32'h0, "T1 after reset");
        #1000;
        spi_reset_register(4'h1);
        spi_reset_register(4'h2);
        spi_reset_register(4'h3);
        spi_reset_register(4'h4);
        #1000;
        
        //#1000;
        spi_reset_register(4'h1);
        spi_reset_register(4'h2);
        spi_reset_register(4'h3);
        spi_reset_register(4'h4);
        #1000;

        // RESULTS SUMMARY
        $display("\n/////////////////////");
        $display(" TEST RESULTS");
        $display("////////////////////");
        $display("  PASSED: %0d", pass_cnt);
        $display("  FAILED: %0d", fail_cnt);
        $display("  TOTAL:  %0d", test_num);
        if (fail_cnt == 0)
            $display("  >>> ALL TESTS PASSED \xf0\x9f\xab\xa1  <<<");
        else
            $display("  >>> FAILURES DETECTED <<<");
        $display("===========================\n");

        #500;
        test_complete <= 1'b1;
    end

endmodule
