// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
// Date        : Mon Mar 15 11:47:46 2021
// Host        : xiongyu running 64-bit Ubuntu 18.04.5 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/vitis/projects/tinyriscv_zynq/tinyriscv_zynq.srcs/sources_1/bd/design_1/ip/design_1_tinyriscv_soc_top_0_0/design_1_tinyriscv_soc_top_0_0_stub.v
// Design      : design_1_tinyriscv_soc_top_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "tinyriscv_soc_top,Vivado 2020.1" *)
module design_1_tinyriscv_soc_top_0_0(sysclk, sysrst, sysled, over, succ, halted_ind, 
  uart_debug_pin, uart_tx_pin, uart_rx_pin, gpio, jtag_TCK, jtag_TMS, jtag_TDI, jtag_TDO, spi_miso, 
  spi_mosi, spi_ss, spi_clk)
/* synthesis syn_black_box black_box_pad_pin="sysclk,sysrst,sysled,over,succ,halted_ind,uart_debug_pin,uart_tx_pin,uart_rx_pin,gpio[1:0],jtag_TCK,jtag_TMS,jtag_TDI,jtag_TDO,spi_miso,spi_mosi,spi_ss,spi_clk" */;
  input sysclk;
  input sysrst;
  output sysled;
  output over;
  output succ;
  output halted_ind;
  input uart_debug_pin;
  output uart_tx_pin;
  input uart_rx_pin;
  inout [1:0]gpio;
  input jtag_TCK;
  input jtag_TMS;
  input jtag_TDI;
  output jtag_TDO;
  input spi_miso;
  output spi_mosi;
  output spi_ss;
  output spi_clk;
endmodule
