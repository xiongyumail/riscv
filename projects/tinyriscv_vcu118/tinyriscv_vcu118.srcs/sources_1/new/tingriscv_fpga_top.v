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

    output halted_ind,  // jtag是否已经halt住CPU信号
    
    output [1:0] gpio_led,

    output uart_tx_pin, // UART发送引脚
    input uart_rx_pin,  // UART接收引脚
    inout [1:0] gpio,    // GPIO引脚

    input jtag_TCK,     // JTAG TCK引脚
    input jtag_TMS,     // JTAG TMS引脚
    input jtag_TDI,     // JTAG TDI引脚
    output jtag_TDO    // JTAG TDO引脚
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

wire halted_ind_n;

assign halted_ind = ~halted_ind_n;
assign gpio_led = gpio;

localparam SYSLED_DIV = 50000000;
reg[25:0] sysled_cnt;
reg sysled;

always @ (posedge clk_50m) begin
    if (sysrst == 1) begin
        sysled_cnt <= 26'd0;
    end else begin
        if (sysled_cnt == SYSLED_DIV / 2 - 1) begin
            sysled_cnt <= 26'd0;
        end else begin
            sysled_cnt <= sysled_cnt + 1'd1;
        end
    end
end

always @ (posedge clk_50m) begin
    if (sysrst == 1) begin
        sysled <= 1'b0;
    end else begin
        if (sysled_cnt == SYSLED_DIV / 2 - 1) begin
            sysled <= !sysled;
        end else begin
            sysled <= sysled;
        end
    end
end

tinyriscv_soc_top tinyriscv_soc_top_inst
(
    .clk(clk_50m),        
    .rst_ext_i(~sysrst),

    .halted_ind(halted_ind_n),  // jtag是否已经halt住CPU信号

    .uart_tx_pin(uart_tx_pin), // UART发送引脚
    .uart_rx_pin(uart_rx_pin),  // UART接收引脚
    .gpio(gpio),    // GPIO引脚

    .jtag_TCK(jtag_TCK),     // JTAG TCK引脚
    .jtag_TMS(jtag_TMS),     // JTAG TMS引脚
    .jtag_TDI(jtag_TDI),     // JTAG TDI引脚
    .jtag_TDO(jtag_TDO)    // JTAG TDO引脚
 );
endmodule
