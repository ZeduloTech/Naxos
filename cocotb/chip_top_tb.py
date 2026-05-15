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
pdk_root = os.getenv("PDK_ROOT", Path("../gf180mcu").absolute())
pdk = os.getenv("PDK", "gf180mcuD")
scl = os.getenv("SCL", "gf180mcu_as_sc_mcu7t3v3")
gl = os.getenv("GL", False)
sdf = os.getenv("SDF", False)
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
        "HEX_PREFIX" : hex_prefix,
        "FINAL_PREFIX" : str(proj_path / "../final") + "/",
        "CARAVEL_FINAL_PREFIX" : str(proj_path / "../caravel/final") + "/",
        "OSC_FINAL_PREFIX" : str(proj_path / "../caravel/ring_osc2x13/final") + "/"
    })

    sources.append(Path(pdk_root) / pdk / "libs.ref" / scl / "verilog" / f"{scl}.v")
#    sources.append(Path(pdk_root) / pdk / "libs.ref" / scl / "verilog" / "primitives.v")
# 5V cells needed for ring_osc2x13 macro
    sources.append(Path(pdk_root) / pdk / "libs.ref" / "gf180mcu_fd_sc_mcu7t5v0" / "verilog" / "gf180mcu_fd_sc_mcu7t5v0.v")
    sources.append(Path(pdk_root) / pdk / "libs.ref" / "gf180mcu_fd_sc_mcu7t5v0" / "verilog" / "primitives.v")
    if gl:
        # Use the powered netlist
        sources.append(proj_path / "../caravel/ring_osc2x13/final/pnl/ring_osc2x13.pnl.v")
        sources.append(proj_path / "../caravel/final/pnl/caravel_core.pnl.v")
        sources.append(proj_path / "../final/pnl/chip_top.pnl.v")

        defines.update({"GL" : 1, "USE_POWER_PINS": 1})
        if sdf:
            defines.update({"ENABLE_SDF" : 1})
    else:
        sources.append(proj_path / "../src/chip_top.sv")
        sources.append(proj_path / "../src/chip_core.sv")
        sources.append(proj_path / "../src/wb_counter.v")

        sources += (proj_path / "../caravel/verilog/").glob("*.v")

        defines.update({"SLOT_1X1" : 1, "FUNCTIONAL": 1})

    includes.append(proj_path / "../src")
    includes.append(proj_path / "../caravel/verilog/")
    includes.append(proj_path / "../caravel/sim/common/")

    sources += [
        # IO pad models
        Path(pdk_root) / pdk / "libs.ref/gf180mcu_fd_io/verilog/gf180mcu_fd_io.v",
        Path(pdk_root) / pdk / "libs.ref/gf180mcu_fd_io/verilog/gf180mcu_ws_io.v",
        
        # SRAM macros
        #Path(pdk_root) / pdk / "libs.ref/gf180mcu_fd_ip_sram/verilog/gf180mcu_fd_ip_sram__sram512x8m8wm1.v",
        #proj_path / "../ip/sram/gf180_ram_512x8_wrapper.v",
	#proj_path / "../ip/sram/gf180mcu_ocd_ip_sram__sram1024x8m8wm1.v",
 	proj_path / "../ip/sram/gf180_ram_1024x8_wrapper.v",
 
        # Caravel IP
        proj_path / "../ip/simple_por/verilog/simple_por.v",
        
        # Custom IP
        proj_path / "../ip/gf180mcu_ws_ip__id/vh/gf180mcu_ws_ip__id.v",
        proj_path / "../ip/gf180mcu_ws_ip__logo/vh/gf180mcu_ws_ip__logo.v",
    ]

    build_args = []

    if sim == "icarus":
        pass

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
