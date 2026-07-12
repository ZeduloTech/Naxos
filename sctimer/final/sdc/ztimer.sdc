###############################################################################
# Created by write_sdc
###############################################################################
current_design ztimer
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name clk_i -period 20.0000 [get_ports {clk_i}]
set_clock_transition 0.1500 [get_clocks {clk_i}]
set_clock_uncertainty 0.2500 clk_i
set_propagated_clock [get_clocks {clk_i}]
set_input_delay 4.0000 -clock [get_clocks {clk_i}] -add_delay [get_ports {cio_csb_i}]
set_input_delay 4.0000 -clock [get_clocks {clk_i}] -add_delay [get_ports {cio_sck_i}]
set_input_delay 4.0000 -clock [get_clocks {clk_i}] -add_delay [get_ports {cio_sd_i}]
set_input_delay 4.0000 -clock [get_clocks {clk_i}] -add_delay [get_ports {rst_ni}]
set_input_delay 4.0000 -clock [get_clocks {clk_i}] -add_delay [get_ports {start_i}]
set_input_delay 4.0000 -clock [get_clocks {clk_i}] -add_delay [get_ports {stop_i}]
set_output_delay 4.0000 -clock [get_clocks {clk_i}] -add_delay [get_ports {cio_sd_o}]
###############################################################################
# Environment
###############################################################################
set_load -pin_load 0.0729 [get_ports {cio_sd_o}]
set_driving_cell -lib_cell gf180mcu_as_sc_mcu7t3v3__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {cio_csb_i}]
set_driving_cell -lib_cell gf180mcu_as_sc_mcu7t3v3__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {cio_sck_i}]
set_driving_cell -lib_cell gf180mcu_as_sc_mcu7t3v3__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {cio_sd_i}]
set_driving_cell -lib_cell gf180mcu_as_sc_mcu7t3v3__inv_4 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {clk_i}]
set_driving_cell -lib_cell gf180mcu_as_sc_mcu7t3v3__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {rst_ni}]
set_driving_cell -lib_cell gf180mcu_as_sc_mcu7t3v3__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {start_i}]
set_driving_cell -lib_cell gf180mcu_as_sc_mcu7t3v3__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {stop_i}]
###############################################################################
# Design Rules
###############################################################################
set_max_transition 1.5000 [current_design]
set_max_capacitance 0.2000 [current_design]
set_max_fanout 9.0000 [current_design]
