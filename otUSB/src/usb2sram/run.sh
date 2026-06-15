#!/bin/bash
clear

SRAM_WRAPPER_DIR=../../../ip/sram

echo "Running Test"

iverilog -g2012 -DUSE_GF180_MACRO -o sim \
	$SRAM_WRAPPER_DIR/gf180_ram_1024x8_wrapper.v \
	usb2sram.sv \
	sram_1024_model.sv \
	tb_usb2sram.sv 

vvp sim
rm -rf sim *.vcd 
