`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/10 03:41:17
// Design Name: 
// Module Name: tingriscv_fpga_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tingriscv_fpga_top(
    input clk_250m_p,
    input clk_250m_n,
            
    input sysrst,
    
    output sysled,       // 系统状态指示灯

    output over,         // 测试是否完成信号
    output succ,         // 测试是否成功信号

    output halted_ind,  // jtag是否已经halt住CPU信号
    
    output [1:0] gpio_led,
    
    input uart_debug_pin, // 串口下载使能引脚

    output uart_tx_pin, // UART发送引脚
    input uart_rx_pin,  // UART接收引脚
    inout [1:0] gpio,    // GPIO引脚

    input jtag_TCK,     // JTAG TCK引脚
    input jtag_TMS,     // JTAG TMS引脚
    input jtag_TDI,     // JTAG TDI引脚
    output jtag_TDO,    // JTAG TDO引脚

    input spi_miso,     // SPI MISO引脚
    output spi_mosi,    // SPI MOSI引脚
    output spi_ss,      // SPI SS引脚
    output spi_clk      // SPI CLK引脚
    );
    
    
wire clk_50m;
clk_wiz_0 clk_wiz_0_inst
(
    // Clock out ports  
    .clk_out1(clk_50m),
    // Clock in ports
    .clk_in1_p(clk_250m_p),
    .clk_in1_n(clk_250m_n)
);

wire over_n, succ_n, halted_ind_n;

assign over = ~over_n;
assign succ = ~succ_n;
assign halted_ind = ~halted_ind_n;
assign gpio_led = gpio;

tinyriscv_soc_top tinyriscv_soc_top_inst
(
    .sysclk(clk_50m),        
    .sysrst(~sysrst),
    
    .sysled(sysled),       // 系统状态指示灯

    .over(over_n),         // 测试是否完成信号
    .succ(succ_n),         // 测试是否成功信号

    .halted_ind(halted_ind_n),  // jtag是否已经halt住CPU信号

    .uart_debug_pin(uart_debug_pin), // 串口下载使能引脚

    .uart_tx_pin(uart_tx_pin), // UART发送引脚
    .uart_rx_pin(uart_rx_pin),  // UART接收引脚
    .gpio(gpio),    // GPIO引脚

    .jtag_TCK(jtag_TCK),     // JTAG TCK引脚
    .jtag_TMS(jtag_TMS),     // JTAG TMS引脚
    .jtag_TDI(jtag_TDI),     // JTAG TDI引脚
    .jtag_TDO(jtag_TDO),    // JTAG TDO引脚

    .spi_miso(spi_miso),     // SPI MISO引脚
    .spi_mosi(spi_mosi),    // SPI MOSI引脚
    .spi_ss(spi_ss),      // SPI SS引脚
    .spi_clk(spi_clk)      // SPI CLK引脚

 );
endmodule
