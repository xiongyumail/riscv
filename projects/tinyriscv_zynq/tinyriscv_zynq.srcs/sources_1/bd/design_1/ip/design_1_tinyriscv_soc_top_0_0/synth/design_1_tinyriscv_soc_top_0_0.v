// (c) Copyright 1995-2021 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: user.org:user:tinyriscv_soc_top:1.0
// IP Revision: 2

(* X_CORE_INFO = "tinyriscv_soc_top,Vivado 2020.1" *)
(* CHECK_LICENSE_TYPE = "design_1_tinyriscv_soc_top_0_0,tinyriscv_soc_top,{}" *)
(* IP_DEFINITION_SOURCE = "package_project" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module design_1_tinyriscv_soc_top_0_0 (
  sysclk,
  sysrst,
  sysled,
  over,
  succ,
  halted_ind,
  uart_debug_pin,
  uart_tx_pin,
  uart_rx_pin,
  gpio,
  jtag_TCK,
  jtag_TMS,
  jtag_TDI,
  jtag_TDO,
  spi_miso,
  spi_mosi,
  spi_ss,
  spi_clk
);

input wire sysclk;
input wire sysrst;
output wire sysled;
output wire over;
output wire succ;
output wire halted_ind;
input wire uart_debug_pin;
output wire uart_tx_pin;
input wire uart_rx_pin;
inout wire [1 : 0] gpio;
input wire jtag_TCK;
input wire jtag_TMS;
input wire jtag_TDI;
output wire jtag_TDO;
input wire spi_miso;
output wire spi_mosi;
output wire spi_ss;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME spi_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN design_1_tinyriscv_soc_top_0_0_spi_clk, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 spi_clk CLK" *)
output wire spi_clk;

  tinyriscv_soc_top inst (
    .sysclk(sysclk),
    .sysrst(sysrst),
    .sysled(sysled),
    .over(over),
    .succ(succ),
    .halted_ind(halted_ind),
    .uart_debug_pin(uart_debug_pin),
    .uart_tx_pin(uart_tx_pin),
    .uart_rx_pin(uart_rx_pin),
    .gpio(gpio),
    .jtag_TCK(jtag_TCK),
    .jtag_TMS(jtag_TMS),
    .jtag_TDI(jtag_TDI),
    .jtag_TDO(jtag_TDO),
    .spi_miso(spi_miso),
    .spi_mosi(spi_mosi),
    .spi_ss(spi_ss),
    .spi_clk(spi_clk)
  );
endmodule
