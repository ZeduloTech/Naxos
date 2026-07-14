// SPDX-FileCopyrightText: 2020 Efabless Corporation
//                         2025 egorxe
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

/*--------------------------------------------------------------*/
/* caravel, a project harness for the Google/GF GF180MCU        */
/* fabrication process and open source PDK                      */
/*                                                              */
/* Copyright 2020 efabless, Inc.                                */
/* Written by Tim Edwards, December 2019                        */
/* and Mohamed Shalan, August 2020                              */
/* This file is open source hardware released under the         */
/* Apache 2.0 license.  See file LICENSE.                       */
/*                                                              */
/* Updated 10/15/2021:  Revised using the housekeeping module   */
/* from housekeeping.v (refactoring a number of functions from  */
/* the management SoC).                                         */
/*                                                              */
/* Updated 05/26/2022:  Revised for the GF180MCU process.       */
/*                                                              */
/* Updated 13/10/2025:  Adapted by egorxe to be used with       */
/* wafer.space GF180MCU template. Number of GPIOs reduced and   */
/* user project moved outside.                                  */
/*                                                              */
/*--------------------------------------------------------------*/

 `ifdef SIM
 `default_nettype wire
 `endif
`include "defines.v"

module caravel_core (

    // All top-level I/O are package-facing pins

`ifdef USE_POWER_PINS
    inout VDD,        // Common 5.0V padframe/ESD power
    inout VSS,        // Common padframe/ESD ground
`endif
    // SoC Core Interface
    input  rstb,
    input  clock_core,
    output gpio_out_core,
    input  gpio_in_core,
    output gpio_outenb_core,
    output gpio_inenb_core,

    // SPI flash interface
    output flash_csb_frame,
    output flash_clk_frame,
    output flash_csb_oe,
    output flash_clk_oe,
    output flash_io0_oe,
    output flash_io1_oe,
    output flash_io0_ie,
    output flash_io1_ie,
    output flash_io0_do,
    output flash_io1_do,
    input  flash_io0_di,
    input  flash_io1_di,

    // Caravel IO (part of legacy mprj IO)
    input  [`CARAVEL_IO_PADS-1:0] caravel_io_in,
    output [`CARAVEL_IO_PADS-1:0] caravel_io_out,
    output [`CARAVEL_IO_PADS-1:0] caravel_io_oe,
    output [`CARAVEL_IO_PADS-1:0] caravel_io_ie,
    output [`CARAVEL_IO_PADS-1:0] caravel_io_schmitt_sel,
    output [`CARAVEL_IO_PADS-1:0] caravel_io_pullup_sel,
    output [`CARAVEL_IO_PADS-1:0] caravel_io_pulldown_sel,
    output [`CARAVEL_IO_PADS-1:0] caravel_io_slew_sel,
    
    // Wishbone for user project
    output user_wb_clk_o,
    output user_wb_rst_o,
    output user_wb_cyc_o,
    output user_wb_stb_o,
    output user_wb_we_o,
    output [3:0]  user_wb_sel_o,
    output [31:0] user_wb_adr_o,
    output [31:0] user_wb_dat_o,
    input  [31:0] user_wb_dat_i,
    input  user_wb_ack_i,
    
    // Multiplexed user IO
    output [`CARAVEL_IO_PADS-1:0] user_gpio_in,
    input  [`CARAVEL_IO_PADS-1:0] user_gpio_out,
    input  [`CARAVEL_IO_PADS-1:0] user_gpio_oeb,
    
    // Additional user signals
    output user_clock2,
    input  user_irq_core,
    
    // Power-on reset (active-low)
    output npor,
    
    // Start mode: 0 - normal mode, 1 - self sufficient mode, starts from user memory with DCO clock
    input start_mode
);

    //------------------------------------------------------------
    // This value is uniquely defined for each user project.
    //------------------------------------------------------------
    parameter USER_PROJECT_ID = 32'h00000000;

    /*
     *--------------------------------------------------------------------
     *
     * These pins are overlaid on mprj_io space.  They have the function
     * below when the management processor is in reset, or in the default
     * configuration.  They are assigned to uses in the user space by the
     * configuration program running off of the SPI flash.  Note that even
     * when the user has taken control of these pins, they can be restored
     * to the original use by setting the resetb pin low.  The SPI pins and
     * UART pins can be connected directly to an FTDI chip as long as the
     * FTDI chip sets these lines to high impedence (input function) at
     * all times except when holding the chip in reset.
     *
     * JTAG       = mprj_io[0]        (inout)
     * SDO       = mprj_io[1]        (output)
     * SDI       = mprj_io[2]        (input)
     * CSB       = mprj_io[3]        (input)
     * SCK      = mprj_io[4]        (input)
     * ser_rx     = mprj_io[5]        (input)
     * ser_tx     = mprj_io[6]        (output)
     * irq       = mprj_io[7]        (input)
     *
     * spi_sck    = mprj_io[32]        (output)
     * spi_csb    = mprj_io[33]        (output)
     * spi_sdi    = mprj_io[34]        (input)
     * spi_sdo    = mprj_io[35]        (output)
     * flash_io2  = mprj_io[36]        (inout) 
     * flash_io3  = mprj_io[37]        (inout) 
     *
     * These pins are reserved for any project that wants to incorporate
     * its own processor and flash controller.  While a user project can
     * technically use any available I/O pins for the purpose, these
     * four pins connect to a pass-through mode from the SPI slave (pins
     * 1-4 above) so that any SPI flash connected to these specific pins
     * can be accessed through the SPI slave even when the processor is in
     * reset.
     *
     * user_flash_csb = mprj_io[8]
     * user_flash_sck = mprj_io[9]
     * user_flash_io0 = mprj_io[10]
     * user_flash_io1 = mprj_io[11]
     *
     *--------------------------------------------------------------------
     */
     
    wire [`MPRJ_IO_PADS-1:0] mprj_io_in;
    wire [`MPRJ_IO_PADS-1:0] mprj_io_out;
    wire [`MPRJ_IO_PADS-1:0] mprj_io_oe;
    wire [`MPRJ_IO_PADS-1:0] mprj_io_ie;
    wire [`MPRJ_IO_PADS-1:0] mprj_io_schmitt_sel;
    wire [`MPRJ_IO_PADS-1:0] mprj_io_pullup_sel;
    wire [`MPRJ_IO_PADS-1:0] mprj_io_pulldown_sel;
    wire [`MPRJ_IO_PADS-1:0] mprj_io_slew_sel;
    wire [`MPRJ_IO_PADS*2-1:0] mprj_io_drive_sel;

    // User Project Control (user-facing)
    wire [`MPRJ_IO_PADS-1:0] user_io_oeb;
    wire [`MPRJ_IO_PADS-1:0] user_io_in;
    wire [`MPRJ_IO_PADS-1:0] user_io_out;
    
    /* Padframe control signals */
    wire [1:0] gpio_drive_select_core;  // bogus

    // User Project Control management I/O
    // There are two types of GPIO connections:
    // (1) Full Bidirectional: Management connects to in, out, and oe
    //     Uses:  JTAG and SDO
    // (2) Selectable bidirectional:  Management connects to in and out,
    //       which are tied together.  oe is grounded (oe from the
    //       configuration is used)

    // SDI      = mprj_io[2]        (input)
    // CSB      = mprj_io[3]        (input)
    // SCK     = mprj_io[4]        (input)
    // ser_rx    = mprj_io[5]        (input)
    // ser_tx    = mprj_io[6]        (output)
    // irq      = mprj_io[7]        (input)

    wire [`MPRJ_IO_PADS-1:0] mgmt_io_in;    /* two- and three-pin data */
    wire [`MPRJ_IO_PADS-1:0] mgmt_io_out;    /* two- and three-pin data */
    wire [`MPRJ_IO_PADS-5:0] mgmt_io_nc;    /* two- and three-pin data */
    wire [4:0] mgmt_io_oeb;            /* three-pin output enable */
    wire [`MPRJ_PWR_PADS-1:0] pwr_ctrl_nc;    /* no-connects */

    //Signals for hk
    wire [`MPRJ_IO_PADS-1:0] mgmt_io_in_hk;
    wire [`MPRJ_IO_PADS-1:0] mgmt_io_out_hk;

    // Power-on-reset signal, both sense-positive and inverted.

    wire porb_prebuf;
    wire porb0;
    wire porb1;
    wire porb2;
    wire por;

    // Flash SPI communication (management SoC to housekeeping)
    wire flash_clk_core,     flash_csb_core;
    wire flash_clk_oeb_core,  flash_csb_oeb_core;
    wire flash_io0_oeb_core,  flash_io1_oeb_core;
    wire flash_io2_oeb_core,  flash_io3_oeb_core;
    wire flash_io0_do_core,  flash_io1_do_core;
    wire flash_io2_do_core,  flash_io3_do_core;
    wire flash_io0_di_core,  flash_io1_di_core;
    wire flash_io2_di_core,  flash_io3_di_core;

    // Various clocks
    wire caravel_clk;
    wire clock_core_postbuf;
    wire clock_core_buf;
    wire flash_clk_frame_prebuf;
    wire clock_core_forpll;
    wire caravel_clk2;
    wire caravel_rstn;

    // Logic analyzer signals
    wire [63:0] la_data_in_user;  // From CPU to MPRJ
    wire [63:0] la_data_in_mprj;  // From MPRJ to CPU
    wire [63:0] la_data_out_mprj; // From CPU to MPRJ
    wire [63:0] la_data_out_user; // From MPRJ to CPU
    wire [63:0] la_oenb_user;     // From CPU to MPRJ
    wire [63:0] la_oenb_mprj;     // From CPU to MPRJ
    wire [63:0] la_iena_mprj;     // From CPU only

    wire [2:0]   user_irq;      // From MRPJ to CPU
    wire [2:0]   user_irq_ena;
    wire [2:0]   irq_spi;       // From SPI and external pins

    // Exported Wishbone Bus (processor facing)
    wire mprj_iena_wb;
    wire mprj_wb_ena;
    wire mprj_cyc_o_core;
    wire mprj_stb_o_core;
    wire mprj_we_o_core;
    wire [3:0] mprj_sel_o_core;
    wire [31:0] mprj_adr_o_core;
    wire [31:0] mprj_dat_o_core;
    wire mprj_ack_i_core;
    wire [31:0] mprj_dat_i_core;

    wire [31:0] hk_dat_i;
    wire hk_ack_i;
    wire hk_stb_o;
    wire hk_cyc_o;

    // Exported Wishbone Bus (user area facing)
    wire     mprj_cyc_o_user;
    wire     mprj_stb_o_user;
    wire     mprj_we_o_user;
    wire [3:0]  mprj_sel_o_user;
    wire [31:0] mprj_adr_o_user;
    wire [31:0] mprj_dat_o_user;
    wire [31:0] mprj_dat_i_user;
    wire    mprj_ack_i_user;

    // Mask revision
    wire [31:0] mask_rev;

    wire     mprj_clock;
    wire     mprj_clock2;
    wire     mprj_reset;
    
    wire qspi_enabled, uart_enabled, spi_enabled, debug_mode;
    wire ser_tx, ser_rx;
    
    wire spi_sdi;
    wire spi_csb;
    wire spi_sck;
    wire spi_sdo;
    wire spi_sdoenb;
    
    wire debug_in;
    wire debug_out;
    wire debug_oeb;
    wire trap;
    
     // Connect legacy mprj to the actual IO
    assign mprj_io_in = {caravel_io_in[`CARAVEL_IO_PADS-1:`MPRJ_TO_CARAVEL_LO], {(`MPRJ_IO_PADS-`CARAVEL_IO_PADS){1'b0}}, caravel_io_in[`MPRJ_TO_CARAVEL_LO-1:0]};
    assign caravel_io_out = {mprj_io_out[`MPRJ_IO_PADS-1:`MPRJ_IO_PADS-`MPRJ_TO_CARAVEL_HI], mprj_io_out[`MPRJ_TO_CARAVEL_LO-1:0]};
    assign caravel_io_oe = {mprj_io_oe[`MPRJ_IO_PADS-1:`MPRJ_IO_PADS-`MPRJ_TO_CARAVEL_HI], mprj_io_oe[`MPRJ_TO_CARAVEL_LO-1:0]};
    assign caravel_io_ie = {mprj_io_ie[`MPRJ_IO_PADS-1:`MPRJ_IO_PADS-`MPRJ_TO_CARAVEL_HI], mprj_io_ie[`MPRJ_TO_CARAVEL_LO-1:0]};
    assign caravel_io_schmitt_sel = {mprj_io_schmitt_sel[`MPRJ_IO_PADS-1:`MPRJ_IO_PADS-`MPRJ_TO_CARAVEL_HI], mprj_io_schmitt_sel[`MPRJ_TO_CARAVEL_LO-1:0]};
    assign caravel_io_pullup_sel = {mprj_io_pullup_sel[`MPRJ_IO_PADS-1:`MPRJ_IO_PADS-`MPRJ_TO_CARAVEL_HI], mprj_io_pullup_sel[`MPRJ_TO_CARAVEL_LO-1:0]};
    assign caravel_io_pulldown_sel = {mprj_io_pulldown_sel[`MPRJ_IO_PADS-1:`MPRJ_IO_PADS-`MPRJ_TO_CARAVEL_HI], mprj_io_pulldown_sel[`MPRJ_TO_CARAVEL_LO-1:0]};
    assign caravel_io_slew_sel = {mprj_io_slew_sel[`MPRJ_IO_PADS-1:`MPRJ_IO_PADS-`MPRJ_TO_CARAVEL_HI], mprj_io_slew_sel[`MPRJ_TO_CARAVEL_LO-1:0]};
    
    assign mask_rev = '0;
    
    // Management processor (wrapper).  Any management core
    // implementation must match this pinout.

    mgmt_core_wrapper soc (
    `ifdef USE_POWER_PINS
        .VDD(VDD),
        .VSS(VSS),
    `endif

        // Clock and reset
        .core_clk(caravel_clk),
        .core_rstn(caravel_rstn),
    
        // GPIO (1 pin)
        .gpio_out_pad(gpio_out_core),
        .gpio_in_pad(gpio_in_core),
        .gpio_mode0_pad(gpio_drive_select_core[0]),
        .gpio_mode1_pad(gpio_drive_select_core[1]),
        .gpio_outenb_pad(gpio_outenb_core),
        .gpio_inenb_pad(gpio_inenb_core),
    
        // Primary SPI flash controller
        .flash_csb(flash_csb_core),
        .flash_clk(flash_clk_core),
        .flash_io0_oeb(flash_io0_oeb_core),
        .flash_io0_di(flash_io0_di_core),
        .flash_io0_do(flash_io0_do_core),
        .flash_io1_oeb(flash_io1_oeb_core),
        .flash_io1_di(flash_io1_di_core),
        .flash_io1_do(flash_io1_do_core),
        .flash_io2_oeb(flash_io2_oeb_core),
        .flash_io2_di(flash_io2_di_core),
        .flash_io2_do(flash_io2_do_core),
        .flash_io3_oeb(flash_io3_oeb_core),
        .flash_io3_di(flash_io3_di_core),
        .flash_io3_do(flash_io3_do_core),
    
        // Exported Wishbone Bus
        .mprj_wb_iena(mprj_iena_wb),
        .mprj_cyc_o(mprj_cyc_o_core),
        .mprj_stb_o(mprj_stb_o_core),
        .mprj_we_o(mprj_we_o_core),
        .mprj_sel_o(mprj_sel_o_core),
        .mprj_adr_o(mprj_adr_o_core),
        .mprj_dat_o(mprj_dat_o_core),
        .mprj_ack_i(mprj_ack_i_core),
        .mprj_dat_i(mprj_dat_i_core),
    
        .hk_stb_o(hk_stb_o),
        .hk_cyc_o(hk_cyc_o),
        .hk_dat_i(hk_dat_i),
        .hk_ack_i(hk_ack_i),
    
        // IRQ
        .irq({irq_spi, user_irq}),
        .user_irq_ena(user_irq_ena),
    
        // Module status (these may or may not be implemented)
        .qspi_enabled(qspi_enabled),
        .uart_enabled(uart_enabled),
        .spi_enabled(spi_enabled),
        .debug_mode(debug_mode),
    
        // Module I/O (these may or may not be implemented)
        // UART
        .ser_tx(ser_tx),
        .ser_rx(ser_rx),
        // SPI master
        .spi_sdi(spi_sdi),
        .spi_csb(spi_csb),
        .spi_sck(spi_sck),
        .spi_sdo(spi_sdo),
        .spi_sdoenb(spi_sdoenb),
        // Debug
        .debug_in(debug_in),
        .debug_out(debug_out),
        .debug_oeb(debug_oeb),
        // Logic analyzer
        .la_input(la_data_in_mprj),
        .la_output(la_data_out_mprj),
        .la_oenb(la_oenb_mprj),
        .la_iena(la_iena_mprj),
    
        // Trap status
        .trap(trap),
        
        // Self-sufficient mode
        .start_from_user(start_mode)
    );

    /* Clock and reset to user space are passed through a tristate    */
    /* buffer like the above, but since they are intended to be        */
    /* always active, connect the enable to the logic-1 output from    */
    /* the VDD domain.                            */

    mgmt_protect mgmt_buffers (
    `ifdef USE_POWER_PINS
         .VDD(VDD),
        .VSS(VSS),
    `endif
        .caravel_clk(caravel_clk),
        .caravel_clk2(caravel_clk2),
        .caravel_rstn(caravel_rstn),
        .mprj_iena_wb(mprj_wb_ena),
        .mprj_cyc_o_core(mprj_cyc_o_core),
        .mprj_stb_o_core(mprj_stb_o_core),
        .mprj_we_o_core(mprj_we_o_core),
        .mprj_sel_o_core(mprj_sel_o_core),
        .mprj_adr_o_core(mprj_adr_o_core),
        .mprj_dat_o_core(mprj_dat_o_core),
        .mprj_ack_i_core(mprj_ack_i_core),
        .mprj_dat_i_core(mprj_dat_i_core),
        .user_irq_core({1'b0, 1'b0, user_irq_core}),
        .user_irq_ena(user_irq_ena),
        .la_data_out_core(la_data_out_user),
        .la_data_out_mprj(la_data_out_mprj),
        .la_data_in_core(la_data_in_user),
        .la_data_in_mprj(la_data_in_mprj),
        .la_oenb_mprj(la_oenb_mprj),
        .la_oenb_core(la_oenb_user),
        .la_iena_mprj(la_iena_mprj),
    
        .user_clock(mprj_clock),
        .user_clock2(mprj_clock2),
        .user_reset(mprj_reset),
        .mprj_cyc_o_user(mprj_cyc_o_user),
        .mprj_stb_o_user(mprj_stb_o_user),
        .mprj_we_o_user(mprj_we_o_user),
        .mprj_sel_o_user(mprj_sel_o_user),
        .mprj_adr_o_user(mprj_adr_o_user),
        .mprj_dat_o_user(mprj_dat_o_user),
        .mprj_dat_i_user(mprj_dat_i_user),
        .mprj_ack_i_user(mprj_ack_i_user),
        .user_irq(user_irq)
    );
    assign mprj_wb_ena = mprj_iena_wb | start_mode;

    /*--------------------------------------------------*/
    /* user_project_wrapper was here                    */
    /* Connect user signals, from outside of Caravel    */
    /*--------------------------------------------------*/

    (* keep, dont_touch *) gf180mcu_as_sc_mcu7t3v3__clkbuff_12 user_wb_clk_buf (
        .A(mprj_clock),
        .Y(user_wb_clk_o)
    );
    
    assign user_wb_rst_o = mprj_reset;
    
    assign user_wb_cyc_o = mprj_cyc_o_user;
    assign user_wb_stb_o = mprj_stb_o_user;
    assign user_wb_we_o  = mprj_we_o_user;
    assign user_wb_sel_o = mprj_sel_o_user;
    assign user_wb_adr_o = mprj_adr_o_user;
    assign user_wb_dat_o = mprj_dat_o_user;
    assign mprj_dat_i_user = user_wb_dat_i;
    assign mprj_ack_i_user = user_wb_ack_i;
    
    assign user_clock2 = mprj_clock2;
    
    assign user_io_out = {user_gpio_out[`CARAVEL_IO_PADS-1:`MPRJ_TO_CARAVEL_LO], {(`MPRJ_IO_PADS-`CARAVEL_IO_PADS){1'b0}}, user_gpio_out[`MPRJ_TO_CARAVEL_LO-1:0]};
    assign user_io_oeb = {user_gpio_oeb[`CARAVEL_IO_PADS-1:`MPRJ_TO_CARAVEL_LO], {(`MPRJ_IO_PADS-`CARAVEL_IO_PADS){1'b1}}, user_gpio_oeb[`MPRJ_TO_CARAVEL_LO-1:0]};
    assign user_gpio_in = {user_io_in[`MPRJ_IO_PADS-1:`MPRJ_IO_PADS-`MPRJ_TO_CARAVEL_HI], user_io_in[`MPRJ_TO_CARAVEL_LO-1:0]};

    /*------------------------------------------*/
    /* Clocking & housekeeping                  */
    /*------------------------------------------*/

    wire [2:0] spi_pll_sel;
    wire [2:0] spi_pll90_sel;
    wire [4:0] spi_pll_div;
    wire [25:0] spi_pll_trim;
    
    wire [`IO_CTRL_BITS*`MPRJ_IO_PADS-1:0] gpio_configure;
    wire gpio_conf_set;


    // mprj_gpio_buffer
    wire [17:0] gpio_buf_mgmt_io_in;    
    wire [17:0] gpio_buf_mgmt_io_out;    
    wire [2:0] gpio_buf_mgmt_io_oeb;    
    //
    wire [17:0] gpio_buf_mgmt_io_in_buf;    
    wire [17:0] gpio_buf_mgmt_io_out_buf;    
    wire [2:0] gpio_buf_mgmt_io_oeb_buf;    
    //
    
    // Clocking control
    
    wire ext_clk_sel, pll_clk, pll_clk90, ext_reset, async_rstn, spi_pll_ena, spi_pll_dco_ena, pll_ena, clk_select;

    caravel_clocking clock_ctrl (
    `ifdef USE_POWER_PINS
        .VDD(VDD),
        .VSS(VSS),
    `endif
        .ext_clk_sel(clk_select),
        .ext_clk(clock_core_postbuf),
        .pll_clk(pll_clk),
        .pll_clk90(pll_clk90),
        .resetb(rstb),
        .porb(porb1),
        .sel(spi_pll_sel),
        .sel2(spi_pll90_sel),
        .ext_reset(ext_reset),  // From housekeeping SPI
        .core_clk(caravel_clk),
        .user_clk(caravel_clk2),
        .resetb_sync(caravel_rstn),
        .resetb_async(async_rstn)
    );
    assign clk_select = ext_clk_sel & ~start_mode;
    
    // these buffers have to be x16 to reduce antenna
    (* keep, dont_touch *) gf180mcu_as_sc_mcu7t3v3__clkbuff_12 coreclkin_clkmovable_buf (
        .A(clock_core),
        .Y(clock_core_buf)
    );
    
    (* keep, dont_touch *) gf180mcu_as_sc_mcu7t3v3__clkbuff_12 core_clk_buf (
        .A(clock_core_buf),
        .Y(clock_core_postbuf)
    );

    // DCO/Digital Locked Loop

    (* keep, dont_touch *) gf180mcu_as_sc_mcu7t3v3__clkbuff_12 pll_in_clk_buf (
        .A(clock_core_buf),
        .Y(clock_core_forpll)
    );
    
    digital_pll pll (
    `ifdef USE_POWER_PINS
        .VDD(VDD),
        .VSS(VSS),
    `endif
        .resetb(async_rstn),
        .enable(pll_ena),
        .osc(clock_core_forpll),
        .clockp({pll_clk, pll_clk90}),
        .div(spi_pll_div),
        .dco(spi_pll_dco_ena),
        .ext_trim(spi_pll_trim)
    );
    
    assign pll_ena = start_mode | spi_pll_ena;

    // Housekeeping interface

    housekeeping housekeeping (
    `ifdef USE_POWER_PINS
        .VDD(VDD),
        .VSS(VSS),
    `endif

        .wb_clk_i(caravel_clk),
        .wb_rstn_i(caravel_rstn),

        .wb_adr_i(mprj_adr_o_core),
        .wb_dat_i(mprj_dat_o_core),
        .wb_sel_i(mprj_sel_o_core),
        .wb_we_i(mprj_we_o_core),
        .wb_cyc_i(hk_cyc_o),
        .wb_stb_i(hk_stb_o),
        .wb_ack_o(hk_ack_i),
        .wb_dat_o(hk_dat_i),

        .porb(porb0),    // Do not connect to other reset sources

        .pll_ena(spi_pll_ena),
        .pll_dco_ena(spi_pll_dco_ena),
        .pll_div(spi_pll_div),
        .pll_sel(spi_pll_sel),
        .pll90_sel(spi_pll90_sel),
        .pll_trim(spi_pll_trim),
        .pll_bypass(ext_clk_sel),

        .qspi_enabled(qspi_enabled),
        .uart_enabled(uart_enabled),
        .spi_enabled(spi_enabled),
        .debug_mode(debug_mode),
    
        .ser_tx(ser_tx),
        .ser_rx(ser_rx),
    
        .spi_sdi(spi_sdi),
        .spi_csb(spi_csb),
        .spi_sck(spi_sck),
        .spi_sdo(spi_sdo),
        .spi_sdoenb(spi_sdoenb),
    
        .debug_in(debug_in),
        .debug_out(debug_out),
        .debug_oeb(debug_oeb),

        .irq(irq_spi),
        .reset(ext_reset),

        .mgmt_gpio_in(mgmt_io_in_hk),
        .mgmt_gpio_out(mgmt_io_out_hk), 
        .mgmt_gpio_oeb({gpio_buf_mgmt_io_oeb, mgmt_io_nc[`MPRJ_IO_PADS-6:0], mgmt_io_oeb[1:0]}), 

        .pwr_ctrl_out(pwr_ctrl_nc),    /* Not used in this version */

        .trap(trap),

        .user_clock(caravel_clk2),

        .mask_rev_in(mask_rev),

        .spimemio_flash_csb(flash_csb_core),
        .spimemio_flash_clk(flash_clk_core),
        .spimemio_flash_io0_oeb(flash_io0_oeb_core),
        .spimemio_flash_io1_oeb(flash_io1_oeb_core),
        .spimemio_flash_io2_oeb(flash_io2_oeb_core),
        .spimemio_flash_io3_oeb(flash_io3_oeb_core),
        .spimemio_flash_io0_do(flash_io0_do_core),
        .spimemio_flash_io1_do(flash_io1_do_core),
        .spimemio_flash_io2_do(flash_io2_do_core),
        .spimemio_flash_io3_do(flash_io3_do_core),
        .spimemio_flash_io0_di(flash_io0_di_core),
        .spimemio_flash_io1_di(flash_io1_di_core),
        .spimemio_flash_io2_di(flash_io2_di_core),
        .spimemio_flash_io3_di(flash_io3_di_core),
    
        .pad_flash_csb(flash_csb_frame),
        .pad_flash_csb_oe(flash_csb_oe),
        .pad_flash_clk(flash_clk_frame_prebuf),
        .pad_flash_clk_oe(flash_clk_oe),
        .pad_flash_io0_oe(flash_io0_oe),
        .pad_flash_io1_oe(flash_io1_oe),
        .pad_flash_io0_ie(flash_io0_ie),
        .pad_flash_io1_ie(flash_io1_ie),
        .pad_flash_io0_do(flash_io0_do),
        .pad_flash_io1_do(flash_io1_do),
        .pad_flash_io0_di(flash_io0_di),
        .pad_flash_io1_di(flash_io1_di),
        
        .gpio_configure_out(gpio_configure),
        .gpio_conf_set(gpio_conf_set)
    );
    
    // Clock buffers to start clocks from in SDC  
    (* keep, dont_touch  *)  gf180mcu_as_sc_mcu7t3v3__clkbuff_12 flash_clk_buf (
        .A(flash_clk_frame_prebuf),
        .Y(flash_clk_frame)
    );

    /*------------------------------------------*/
    /* IO configuration                         */
    /*------------------------------------------*/
    
    // Caravel GPIO config code was kept as is for this wafer.space template version, BUT:
    // 1. Only some IOs are actually connected to the pads, see chip_core.sv.
    // 2. There are no separate GPIO control macros and via-programmed defaults.
    //    Everything is just synthesized together with the core.

    /* First two GPIOs (JTAG and SDO) */

    mprj_io_buffer gpio_buf(
    `ifdef USE_POWER_PINS
        .VDD(VDD),
        .VSS(VSS),
    `endif

        .mgmt_gpio_in(gpio_buf_mgmt_io_in),
        .mgmt_gpio_in_buf(gpio_buf_mgmt_io_in_buf),
        .mgmt_gpio_oeb(gpio_buf_mgmt_io_oeb),
        .mgmt_gpio_oeb_buf(gpio_buf_mgmt_io_oeb_buf),
        .mgmt_gpio_out(gpio_buf_mgmt_io_out),
        .mgmt_gpio_out_buf(gpio_buf_mgmt_io_out_buf)
    );

    //buffer inputs
    assign gpio_buf_mgmt_io_in = mgmt_io_in[37:20];
    assign gpio_buf_mgmt_io_out = mgmt_io_out_hk[37:20];
    //
    assign mgmt_io_in_hk = {gpio_buf_mgmt_io_in_buf, mgmt_io_in[19:0]};
    assign mgmt_io_out = {gpio_buf_mgmt_io_out_buf, mgmt_io_out_hk[19:0]};
    //

    /* GPIO defaults (NOT via programmed) */
    wire [`MPRJ_IO_PADS*10-1:0] gpio_defaults;

    /* Fixed defaults for the first 5 GPIO pins */
    /* GPIO 0 = 009 = output with bidirectional control */
    /* GPIO 1 = 009 = output with bidirectional control (SDO) */
    /* GPIO 2 = 007 = input (SDI) */
    /* GPIO 3 = 087 = input with pullup (CSB) */
    /* GPIO 4 = 007 = input (SCK) */

    gpio_defaults_block #(
    .GPIO_CONFIG_INIT(10'h009)
    ) gpio_defaults_block_0 (
        `ifdef USE_POWER_PINS
        .VDD(VDD),
        .VSS(VSS),
        `endif
    .gpio_defaults(gpio_defaults[9:0])
    );

    gpio_defaults_block #(
    .GPIO_CONFIG_INIT(10'h009)
    ) gpio_defaults_block_1 (
        `ifdef USE_POWER_PINS
        .VDD(VDD),
        .VSS(VSS),
        `endif
    .gpio_defaults(gpio_defaults[19:10])
    );

    gpio_defaults_block #(
    .GPIO_CONFIG_INIT(10'h007)
    ) gpio_defaults_block_2 (
        `ifdef USE_POWER_PINS
        .VDD(VDD),
        .VSS(VSS),
        `endif
    .gpio_defaults(gpio_defaults[29:20])
    );

    gpio_defaults_block #(
    .GPIO_CONFIG_INIT(10'h087)
    ) gpio_defaults_block_3 (
        `ifdef USE_POWER_PINS
        .VDD(VDD),
        .VSS(VSS),
        `endif
    .gpio_defaults(gpio_defaults[39:30])
    );

    gpio_defaults_block #(
    .GPIO_CONFIG_INIT(10'h007)
    ) gpio_defaults_block_4 (
        `ifdef USE_POWER_PINS
        .VDD(VDD),
        .VSS(VSS),
        `endif
    .gpio_defaults(gpio_defaults[49:40])
    );

    // UART RX
    gpio_defaults_block #(
    .GPIO_CONFIG_INIT(`GPIO_MODE_MGMT_STD_INPUT_NOPULL) 
    ) gpio_defaults_block_5 (
        `ifdef USE_POWER_PINS
        .VDD(VDD),
        .VSS(VSS),
        `endif
    .gpio_defaults(gpio_defaults[59:50])
    );

    // UART TX
    gpio_defaults_block #(
    .GPIO_CONFIG_INIT(`GPIO_MODE_MGMT_STD_OUTPUT)       
    ) gpio_defaults_block_6 (
        `ifdef USE_POWER_PINS
        .VDD(VDD),
        .VSS(VSS),
        `endif
    .gpio_defaults(gpio_defaults[69:60])
    );

    // Everything else (mostly unused)
    genvar i;
	generate
		for (i = 7; i < `MPRJ_IO_PADS; i = i + 1) begin
          gpio_defaults_block #(
            .GPIO_CONFIG_INIT(`GPIO_MODE_MGMT_STD_INPUT_NOPULL)
          ) gpio_defaults_block (
                `ifdef USE_POWER_PINS
                .VDD(VDD),
                .VSS(VSS),
                `endif
                .gpio_defaults(gpio_defaults[((i+1)*10)-1:i*10])
            );
		end
	endgenerate
    
	generate
        for (i = 0; i < `MPRJ_IO_PADS; i = i + 1) begin
            gpio_control_block gpio_control (
                `ifdef USE_POWER_PINS
                .VDD(VDD),
                .VSS(VSS),
                `endif

                .gpio_defaults(gpio_defaults[((i+1)*`IO_CTRL_BITS)-1:i*`IO_CTRL_BITS]),
                .gpio_conf_in(gpio_configure[((i+1)*`IO_CTRL_BITS)-1:i*`IO_CTRL_BITS]),
                .gpio_conf_clk(caravel_clk),

                 // Management Soc-facing signals

                .resetn(caravel_rstn),
                .clk(caravel_rstn),
                
                .gpio_conf_set(gpio_conf_set),

                .mgmt_gpio_in(mgmt_io_in[i]),
                .mgmt_gpio_out(mgmt_io_out[i]),
                .mgmt_gpio_oeb(mgmt_io_oeb[i]),

                 // User-facing signals
                .user_gpio_out(user_io_out[i]),
                .user_gpio_oeb(user_io_oeb[i]),
                .user_gpio_in(user_io_in[i]),

                 // Pad-facing signals (Pad GPIOv2)
                .pad_gpio_inen(mprj_io_ie[i]),
                .pad_gpio_schmitt_sel(mprj_io_schmitt_sel[i]),
                .pad_gpio_pullup_sel(mprj_io_pullup_sel[i]),
                .pad_gpio_pulldown_sel(mprj_io_pulldown_sel[i]),
                .pad_gpio_slew_sel(mprj_io_slew_sel[i]),
                .pad_gpio_drive_sel(mprj_io_drive_sel[(i+1)*2-1:i*2]),
                .pad_gpio_outen(mprj_io_oe[i]),
                .pad_gpio_out(mprj_io_out[i]),
                .pad_gpio_in(mprj_io_in[i])
            );
		end
	endgenerate

    // Power-on-reset circuit
    (* keep *) simple_por por_inst (
    `ifdef USE_POWER_PINS
        .VDD(VDD),
        .VSS(VSS),
    `endif
        .porb(porb_prebuf),
        .por(por)
    );
    
    (* keep *)  gf180mcu_as_sc_mcu7t3v3__clkbuff_12 porb0_buf (
        .A(porb_prebuf),
        .Y(porb0)
    );
    
    (* keep *)  gf180mcu_as_sc_mcu7t3v3__clkbuff_12 porb1_buf (
        .A(porb_prebuf),
        .Y(porb1)
    );
    
    (* keep *)  gf180mcu_as_sc_mcu7t3v3__clkbuff_12 porb2_buf (
        .A(porb_prebuf),
        .Y(porb2)
    );
    
    assign npor = porb2;

endmodule
// `default_nettype wire
