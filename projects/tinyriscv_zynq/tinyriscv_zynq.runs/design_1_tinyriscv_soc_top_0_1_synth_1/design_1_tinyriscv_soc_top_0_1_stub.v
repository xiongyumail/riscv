// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
// Date        : Tue Mar 16 12:45:34 2021
// Host        : xiongyu running 64-bit Ubuntu 18.04.5 LTS
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_tinyriscv_soc_top_0_1_stub.v
// Design      : design_1_tinyriscv_soc_top_0_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "tinyriscv_soc_top,Vivado 2020.1" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(clk, rst_ext_i, halted_ind, uart_tx_pin, 
  uart_rx_pin, gpio, jtag_TCK, jtag_TMS, jtag_TDI, jtag_TDO)
/* synthesis syn_black_box black_box_pad_pin="clk,rst_ext_i,halted_ind,uart_tx_pin,uart_rx_pin,gpio[1:0],jtag_TCK,jtag_TMS,jtag_TDI,jtag_TDO" */;
  input clk;
  input rst_ext_i;
  output halted_ind;
  output uart_tx_pin;
  input uart_rx_pin;
  inout [1:0]gpio;
  input jtag_TCK;
  input jtag_TMS;
  input jtag_TDI;
  output jtag_TDO;
endmodule