// SPDX-FileCopyrightText: 2020 Efabless Corporation
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
/*
 *-------------------------------------------gpio_load_2--------------------------
 *
 * This module instantiates a shift register chain that passes through
 * each gpio cell.  These are connected end-to-end around the padframe
 * periphery.  The purpose is to avoid a massive number of control
 * wires between the digital core and I/O, passing through the user area.
 *
 * See mprj_ctrl.v for the module that registers the data for each
 * I/O and drives the input to the shift register.
 *
 *---------------------------------------------------------------------
 */

module gpio_control_block #(
    parameter PAD_CTRL_BITS = `IO_CTRL_BITS
) (
    `ifdef USE_POWER_PINS
         inout VDD,
         inout VSS,
    `endif

    // Power-on defaults
    input [PAD_CTRL_BITS-1:0] gpio_defaults,
    input [PAD_CTRL_BITS-1:0] gpio_conf_in,
    input gpio_conf_clk,    // clock to latch GPIO configuration on

    // Management Soc-facing signals
    input  	 clk,		// Clock to latch data on
    input  	 resetn,	// Global reset
    
    input       gpio_conf_set,

    output      mgmt_gpio_in,		// Management from pad (input only)
    input       mgmt_gpio_out,		// Management to pad (output only)
    input       mgmt_gpio_oeb,		// Management to pad (output only)

    // User-facing signals
    output	wire user_gpio_in,		// Pad to user space
    input        user_gpio_out,		// User space to pad
    input        user_gpio_oeb,		// Output enable (user)

    // Pad-facing signals (Pad GPIOv2)
    output   wire       pad_gpio_inen,
    output   wire       pad_gpio_outen,
    output	 wire       pad_gpio_out,
    input	 wire       pad_gpio_in,
    output	 wire       pad_gpio_slew_sel,
    output	 wire       pad_gpio_schmitt_sel,
    output   wire [1:0] pad_gpio_drive_sel,
    output	 wire       pad_gpio_pullup_sel,
    output	 wire       pad_gpio_pulldown_sel
);

    /* Parameters defining the bit offset of each function in the chain */

    localparam MGMT_EN = 0;	/* Management/user control of GPIO */
    localparam OE_OVR = 1;	/* Output enable override */
    localparam IE = 2;		/* Input enable (sense positive) */
    localparam OE = 3;		/* Manual output enable (sense positive) */
    localparam SCHMITT = 4;	/* CMOS/Schmitt trigger select */
    localparam SLEW = 5;	/* Slew rate select */
    localparam PD = 6;		/* Pull-down select */
    localparam PU = 7;		/* Pull-up select */
    localparam DRIVE = 8;	/* Drive strength select */

    /* Internally registered signals */
    reg	 	mgmt_ena;		// Enable management SoC to access pad
    reg		gpio_oe_override;
    reg		gpio_inen;
    reg		gpio_outen;
    reg		gpio_out;
    reg		gpio_slew_sel;
    reg		gpio_schmitt_sel;
    reg [1:0]	gpio_drive_sel;
    reg		gpio_pullup_sel;
    reg		gpio_pulldown_sel;


    always @(posedge gpio_conf_clk or negedge resetn) begin  // latches
        if (resetn == 1'b0) begin
            /* Initial state on reset depends on applied defaults */
            mgmt_ena 	      <= gpio_defaults[MGMT_EN];
            gpio_oe_override  <= gpio_defaults[OE_OVR];
            gpio_inen 	      <= gpio_defaults[IE];
            gpio_outen        <= gpio_defaults[OE];
            gpio_slew_sel     <= gpio_defaults[SLEW];
            gpio_schmitt_sel  <= gpio_defaults[SCHMITT];
            gpio_pullup_sel   <= gpio_defaults[PU];
            gpio_pulldown_sel <= gpio_defaults[PD];
            gpio_drive_sel    <= gpio_defaults[DRIVE+1:DRIVE];
        end else if (gpio_conf_set == 1'b1) begin
            /* Load data */
            mgmt_ena 	      <= gpio_conf_in[MGMT_EN];
            gpio_oe_override  <= gpio_conf_in[OE_OVR];
            gpio_inen 	      <= gpio_conf_in[IE];
            gpio_outen        <= gpio_conf_in[OE];
            gpio_slew_sel     <= gpio_conf_in[SLEW];
            gpio_schmitt_sel  <= gpio_conf_in[SCHMITT];
            gpio_pullup_sel   <= gpio_conf_in[PU];
            gpio_pulldown_sel <= gpio_conf_in[PD];
            gpio_drive_sel    <= gpio_conf_in[DRIVE+1:DRIVE];
        end
    end

    /* These pad configuration signals are static and do not change	*/
    /* after setup.							*/

    assign pad_gpio_inen            =   gpio_inen;
    assign pad_gpio_slew_sel        =   gpio_slew_sel;
    assign pad_gpio_schmitt_sel     =   gpio_schmitt_sel;
    assign pad_gpio_drive_sel       =   gpio_drive_sel;
    assign pad_gpio_pullup_sel      =   gpio_pullup_sel;
    assign pad_gpio_pulldown_sel    =   gpio_pulldown_sel;

    /* Implement pad control behavior depending on state of mgmt_ena */

    assign user_gpio_in = pad_gpio_in;
    assign mgmt_gpio_in = pad_gpio_in;

    /* OE override signal takes precedence over the state of output enable
     * at the GPIO pad.  Otherwise, the OE signal comes directly from the
     * management SoC or the user project depending on the state of
     * the management enable signal.
     */
    assign pad_gpio_outen = (gpio_oe_override) ? gpio_outen :
			((mgmt_ena) ? ~mgmt_gpio_oeb  : ~user_gpio_oeb);

    assign pad_gpio_out = (mgmt_ena) ? mgmt_gpio_out : user_gpio_out;

endmodule
`default_nettype wire
