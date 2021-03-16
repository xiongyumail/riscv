-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
-- Date        : Mon Mar 15 11:47:46 2021
-- Host        : xiongyu running 64-bit Ubuntu 18.04.5 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/vitis/projects/tinyriscv_zynq/tinyriscv_zynq.srcs/sources_1/bd/design_1/ip/design_1_tinyriscv_soc_top_0_0/design_1_tinyriscv_soc_top_0_0_stub.vhdl
-- Design      : design_1_tinyriscv_soc_top_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_tinyriscv_soc_top_0_0 is
  Port ( 
    sysclk : in STD_LOGIC;
    sysrst : in STD_LOGIC;
    sysled : out STD_LOGIC;
    over : out STD_LOGIC;
    succ : out STD_LOGIC;
    halted_ind : out STD_LOGIC;
    uart_debug_pin : in STD_LOGIC;
    uart_tx_pin : out STD_LOGIC;
    uart_rx_pin : in STD_LOGIC;
    gpio : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    jtag_TCK : in STD_LOGIC;
    jtag_TMS : in STD_LOGIC;
    jtag_TDI : in STD_LOGIC;
    jtag_TDO : out STD_LOGIC;
    spi_miso : in STD_LOGIC;
    spi_mosi : out STD_LOGIC;
    spi_ss : out STD_LOGIC;
    spi_clk : out STD_LOGIC
  );

end design_1_tinyriscv_soc_top_0_0;

architecture stub of design_1_tinyriscv_soc_top_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "sysclk,sysrst,sysled,over,succ,halted_ind,uart_debug_pin,uart_tx_pin,uart_rx_pin,gpio[1:0],jtag_TCK,jtag_TMS,jtag_TDI,jtag_TDO,spi_miso,spi_mosi,spi_ss,spi_clk";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "tinyriscv_soc_top,Vivado 2020.1";
begin
end;
