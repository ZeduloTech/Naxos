#! /usr/bin/env python3
# SPDX-FileCopyrightText: © 2025 Project Template Contributors
# SPDX-License-Identifier: Apache-2.0

import os
import json
import logging
import random
from pathlib import Path
import shutil

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import Timer, RisingEdge
from cocotbext.uart import UartSink
from cocotb_tools.runner import get_runner

sim = os.getenv("SIM", "icarus")
gl = os.getenv("GL", False)
sdf = os.getenv("SDF", False)
pdk_root = os.getenv("PDK_ROOT", Path("../gf180mcu").absolute())
pdk = os.getenv("PDK", "gf180mcuD")
scl = os.getenv("SCL", "gf180mcu_as_sc_mcu7t3v3")
pad = os.getenv("PAD", "gf180mcu_fd_io")
sram = os.getenv("SRAM", "gf180mcu_ocd_ip_sram")
slot = os.getenv("SLOT", "1X0P5").upper()
test_env = os.getenv("TEST", "all")
add_build_args = os.getenv("ADD_BUILD_ARGS", "").split()
add_plus_args = os.getenv("ADD_PLUS_ARGS", "").split()

uart_recv = ""
async def uart_monitor(uart_sink):
    global uart_recv
    while True:
        uart_byte = await uart_sink.read()
        if int.from_bytes(uart_byte) != 0:
            if int.from_bytes(uart_byte) != 0xd:    # ignore CR
                uart_recv += uart_byte.decode("utf-8")
        else:
            # allow zero bytes at the beginning
            assert(not uart_recv)

@cocotb.test(timeout_time=200, timeout_unit="ms")
async def caravel_test(dut):
    """Run the Caravel test"""

    # Create a logger for this testbench
    logger = logging.getLogger()
    logger.setLevel(logging.INFO)
    logger.info(f"Starting Caravel test {os.getenv('TEST_NAME')}")
    
    # Copy efuse hex
    efuse = os.getenv("EFUSE_HEX")
    if efuse:
        shutil.copy(efuse, "efuse_init.hex")

    # Connect UART
    uart_sink = UartSink(dut.uart_tx, baud=19200, bits=8)
    cocotb.start_soon(uart_monitor(uart_sink))
    
    await RisingEdge(dut.test_success)

    uart = os.getenv("EXPECT_UART")
    if uart:
        while len(uart_recv) < len(uart):
            logger.info("Waiting for UART data to arrive...")
            await Timer(100, "us")
        logger.info(f"Checking received UART data: got {uart_recv}, expected {uart}")
        assert(uart == uart_recv)

    logger.info("Done!")


def skip_test(msg):
    """Test skip helper"""
    if "PYTEST_CURRENT_TEST" in os.environ:
        # skip in pytest
        from pytest import skip
        skip(msg)
    else:
        print(msg)

def test_chip_top_runner(test : str):

    proj_path = Path(__file__).resolve().parent

    sources = []
    defines = {}
    includes = []

    hex_prefix = str(proj_path / "../caravel/sim/caravel_sw") + "/"
    defines.update({
        "SIM" : 1, 
        "SLOT_" + slot : "", 
        "HEX_PREFIX" : hex_prefix,
        "FINAL_PREFIX" : str(proj_path / "../final") + "/",
        "CARAVEL_FINAL_PREFIX" : str(proj_path / "../caravel/final") + "/",
        "OSC_FINAL_PREFIX" : str(proj_path / "../caravel/ring_osc2x13/final") + "/"
    })

    sources.append(Path(pdk_root) / pdk / "libs.ref" / scl / "verilog" / f"{scl}.v")
    # sources.append(Path(pdk_root) / pdk / "libs.ref" / scl / "verilog" / "primitives.v")
    # 5V cells needed for ring_osc2x13 macro
    sources.append(Path(pdk_root) / pdk / "libs.ref" / "gf180mcu_fd_sc_mcu7t5v0" / "verilog" / "gf180mcu_fd_sc_mcu7t5v0.v")
    sources.append(Path(pdk_root) / pdk / "libs.ref" / "gf180mcu_fd_sc_mcu7t5v0" / "verilog" / "primitives.v")
    if gl:
        # Use the powered netlist
        sources.append(proj_path / "../caravel/ring_osc2x13/final/pnl/ring_osc2x13.pnl.v")
        sources.append(proj_path / "../caravel/final/pnl/caravel_core.pnl.v")
        sources.append(proj_path / "../final/pnl/chip_top.pnl.v")
        
        sources.append(proj_path / "../ztimer/final/pnl/rosc_spi_bridge.pnl.v"),

        defines.update({"GL" : 1, "USE_POWER_PINS": 1})
        if sdf:
            defines.update({"ENABLE_SDF" : 1})
    else:
        sources.append(proj_path / "../src/chip_top.sv")
        sources.append(proj_path / "../src/chip_core.sv")

        sources += (proj_path / "../caravel/verilog/").glob("*.v")
        
        # Timer IP
        sources.append(proj_path / "../ztimer/src/inverter.v"),
        sources.append(proj_path / "../ztimer/src/not_rosc.v"),
        sources.append(proj_path / "../ztimer/src/rosc_timer.v"),
        sources.append(proj_path / "../ztimer/src/spi_byte_sm.sv"),
        sources.append(proj_path / "../ztimer/src/spi_core.sv"),
        sources.append(proj_path / "../ztimer/src/spi_device.sv"),
        sources.append(proj_path / "../ztimer/src/rosc_spi_bridge.sv"),
        
        # USB IP
        sources.append(proj_path / "../otUSB/src/usb_wrapper.sv"),
        sources.append(proj_path / "../otUSB/src/prim_util/prim_util_pkg.sv"),
        sources.append(proj_path / "../otUSB/src/other_prim/prim_mubi_pkg.sv"),
        sources.append(proj_path / "../otUSB/src/other_prim/prim_buf.sv"),
        sources.append(proj_path / "../otUSB/src/other_prim/prim_clock_mux2.sv"),
        sources.append(proj_path / "../otUSB/src/other_prim/prim_intr_hw.sv"),
        sources.append(proj_path / "../otUSB/src/other_prim/prim_onehot_check.sv"),
        sources.append(proj_path / "../otUSB/src/other_prim/prim_xnor2.sv"),
        sources.append(proj_path / "../otUSB/src/other_prim/prim_reg_we_check.sv"),
        sources.append(proj_path / "../otUSB/src/prim_cdc/prim_cdc_rand_delay.sv"),
        sources.append(proj_path / "../otUSB/src/prim_flop/prim_flop.sv"),
        sources.append(proj_path / "../otUSB/src/prim_flop/prim_sparse_fsm_flop.sv"),
        sources.append(proj_path / "../otUSB/src/prim_flop/prim_flop_2sync.sv"),
        sources.append(proj_path / "../otUSB/src/prim_count/prim_count_pkg.sv"),
        sources.append(proj_path / "../otUSB/src/prim_count/prim_count.sv"),
        sources.append(proj_path / "../otUSB/src/prim_sec/prim_sec_anchor_buf.sv"),
        sources.append(proj_path / "../otUSB/src/prim_sec/prim_sec_anchor_flop.sv"),
        sources.append(proj_path / "../otUSB/src/other_prim/prim_diff_decode.sv"),
        sources.append(proj_path / "../otUSB/src/other_prim/prim_edge_detector.sv"),
        sources.append(proj_path / "../otUSB/src/other_prim/prim_filter.sv"),
        sources.append(proj_path / "../otUSB/src/prim_sync/prim_sync_reqack.sv"),
        sources.append(proj_path / "../otUSB/src/prim_sync/prim_pulse_sync.sv"),
        sources.append(proj_path / "../otUSB/src/prim_cdc/prim_reg_cdc_arb.sv"),
        sources.append(proj_path / "../otUSB/src/prim_cdc/prim_reg_cdc.sv"),
        sources.append(proj_path / "../otUSB/src/prim_fifo/prim_fifo_assert.svh"),
        sources.append(proj_path / "../otUSB/src/prim_fifo/prim_fifo_sync_cnt.sv"),
        sources.append(proj_path / "../otUSB/src/prim_fifo/prim_fifo_sync.sv"),
        sources.append(proj_path / "../otUSB/src/prim_subreg/prim_subreg_pkg.sv"),
        sources.append(proj_path / "../otUSB/src/prim_subreg/prim_subreg_ext.sv"),
        sources.append(proj_path / "../otUSB/src/prim_subreg/prim_subreg_arb.sv"),
        sources.append(proj_path / "../otUSB/src/prim_subreg/prim_subreg.sv"),
        sources.append(proj_path / "../otUSB/src/usb_consts_pkg.sv"),
        sources.append(proj_path / "../otUSB/src/usb_fs_nb_out_pe.sv"),
        sources.append(proj_path / "../otUSB/src/usb_fs_nb_in_pe.sv"),
        sources.append(proj_path / "../otUSB/src/usb_fs_rx.sv"),
        sources.append(proj_path / "../otUSB/src/usb_fs_tx.sv"),
        sources.append(proj_path / "../otUSB/src/usb_fs_tx_mux.sv"),
        sources.append(proj_path / "../otUSB/src/usb_fs_nb_pe.sv"),
        sources.append(proj_path / "../otUSB/src/usbdev_reg_pkg.sv"),
        sources.append(proj_path / "../otUSB/src/support_reg_hw_pkg.sv"),
        sources.append(proj_path / "../otUSB/src/usbdev_counter.sv"),
        sources.append(proj_path / "../otUSB/src/usbdev_linkstate.sv"),
        sources.append(proj_path / "../otUSB/src/usbdev_aon_wake.sv"),
        sources.append(proj_path / "../otUSB/src/usbdev_iomux.sv"),
        sources.append(proj_path / "../otUSB/src/usbdev_usbif.sv"),
        sources.append(proj_path / "../otUSB/src/bus_reg_pkg.sv"),
        sources.append(proj_path / "../otUSB/src/usbdev_reg_top.sv"),
        sources.append(proj_path / "../otUSB/src/usbdev.sv"),


        defines.update({"FUNCTIONAL": 1})

    includes.append(proj_path / "../src")
    includes.append(proj_path / "../caravel/verilog/")
    includes.append(proj_path / "../caravel/sim/common/")
    includes.append(proj_path / "../otUSB/src/prim_fifo/")

    sources += [
        # IO pad models
        Path(pdk_root) / pdk / f"libs.ref/{pad}/verilog/{pad}.v",
        
        # SRAM macros
        Path(pdk_root) / pdk / f"libs.ref/{sram}/verilog/{sram}__sram512x8m8wm1.v",
        proj_path / "../ip/sram/gf180_ram_1024x8_wrapper.v",
        
        # USB model
        proj_path / "../otUSB/tb/usb_host.sv",
        proj_path / "../otUSB/tb/host_rx_pe.sv",
 
        # XTAL IP model
        proj_path / "../ip/XTAL3P3/XTAL.v",
 
        # Caravel POR IP
        proj_path / "../ip/simple_por/verilog/simple_por.v",
 
        # Custom IP
        proj_path / "../ip/gf180mcu_ws_ip__project_id/vh/gf180mcu_ws_ip__project_id.v",
        proj_path / "../ip/gf180mcu_ws_ip__qrcode_id/vh/gf180mcu_ws_ip__qrcode_id.v",
        proj_path / "../ip/gf180mcu_ws_ip__shuttle_id/vh/gf180mcu_ws_ip__shuttle_id.v",
        proj_path / "../ip/gf180mcu_ws_ip__logo/vh/gf180mcu_ws_ip__logo.v",
        proj_path / "../ip/gf180mcu_ws_ip__marker/vh/gf180mcu_ws_ip__marker.v",
    ]

    build_args = []

    if sim == "icarus":
        build_args = ["-g2012"]

    build_args += add_build_args

    if sim == "verilator":
        build_args = ["--timing", "--trace", "--trace-fst", "--trace-structs"]

    tests = json.load(open("test_list.json"))
    test_list = list(tests.keys())

    if test != "all":
        assert test in test_list, f"Unknown test name {test}, valid tests are: {test_list}"
        test_list = [ test ]
        
    for test in test_list:
        
        extra_env = {"TEST_NAME" : test}
        attrib = tests[test]

        if ("skip_glnosdf" in attrib) and (not sdf and gl):
            skip_test(f"Test {test} can't be run with gate level netlist without SDF")
            continue
        
        if "uart" in attrib:
            extra_env.update({"EXPECT_UART" : attrib["uart"]})

        if test[:8] == "caravel_":
            caravel_test = test[8:]

            # Add Caravel sim top and Verilog helpers
            sources += (proj_path / "../caravel/sim/common/").glob("*.v")
            top = f"{caravel_test}_tb"
            sources.append(proj_path / f"../caravel/sim/caravel_tb/{top}.v")

            testcase = "caravel_test"

        else:
            # could be used to launch "cocotb.test" function other than caravel_test
            testcase = f"{test}_test"
            top = "chip_wrapper"

        runner = get_runner(sim)
        runner.build(
            sources=sources,
            hdl_toplevel=top,
            defines=defines,
            always=True,
            includes=includes,
            build_args=build_args,
            build_dir=f"sim_build/{test}" + ("_gl" if gl else ""),
            waves=True,
        )

        plusargs = add_plus_args

        runner.test(
            hdl_toplevel=top,
            test_module="chip_top_tb,",
            plusargs=plusargs,
            waves=True,
            testcase=testcase,
            extra_env=extra_env
        )

if __name__ == "__main__":
    test_chip_top_runner(test_env)
