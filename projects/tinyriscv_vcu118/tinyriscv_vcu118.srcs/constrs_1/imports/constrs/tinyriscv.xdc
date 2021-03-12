## 时钟引脚
#set_property IOSTANDARD LVCMOS18 [get_ports clk_250m_p]
#set_property PACKAGE_PIN E12 [get_ports clk_250m_p]
#set_property IOSTANDARD LVCMOS18 [get_ports clk_250m_n]
#set_property PACKAGE_PIN D12 [get_ports clk_250m_n]
## 时钟约束250MHz
#create_clock -period 4.000 -name sys_clk_pin_p -waveform {0.000 2.000} -add [get_ports clk_250m_p]
#create_clock -period 4.000 -name sys_clk_pin_n -waveform {2.000 4.000} -add [get_ports clk_250m_n]

# 复位引脚
set_property IOSTANDARD LVCMOS18 [get_ports sysrst]
set_property PACKAGE_PIN BE22 [get_ports sysrst]

# 系统状态指示灯
set_property IOSTANDARD LVCMOS18 [get_ports sysled]
set_property PACKAGE_PIN BA37 [get_ports sysled]

# CPU停住指示引脚
set_property IOSTANDARD LVCMOS18 [get_ports halted_ind]
set_property PACKAGE_PIN AY30 [get_ports halted_ind]

# GPIO指示灯
set_property IOSTANDARD LVCMOS18 [get_ports {gpio_led[0]}]
set_property PACKAGE_PIN AT32 [get_ports {gpio_led[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {gpio_led[1]}]
set_property PACKAGE_PIN AV34 [get_ports {gpio_led[1]}]

## 串口下载使能引脚
#set_property IOSTANDARD LVCMOS18 [get_ports uart_debug_pin]
#set_property PACKAGE_PIN Y34 [get_ports uart_debug_pin]

# 串口发送引脚
set_property IOSTANDARD LVCMOS18 [get_ports uart_tx_pin]
set_property PACKAGE_PIN AK30 [get_ports uart_tx_pin]

# 串口接收引脚
set_property IOSTANDARD LVCMOS18 [get_ports uart_rx_pin]
set_property PACKAGE_PIN AP36 [get_ports uart_rx_pin]

# GPIO0引脚
set_property IOSTANDARD LVCMOS18 [get_ports {gpio[0]}]
set_property PACKAGE_PIN T34 [get_ports {gpio[0]}]

# GPIO1引脚
set_property IOSTANDARD LVCMOS18 [get_ports {gpio[1]}]
set_property PACKAGE_PIN W34 [get_ports {gpio[1]}]

# JTAG TCK引脚
set_property IOSTANDARD LVCMOS18 [get_ports jtag_TCK]
set_property PACKAGE_PIN AH34 [get_ports jtag_TCK]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets jtag_TCK_IBUF_inst/O]
#create_clock -period 200 -name jtag_clk_pin -add [get_ports jtag_TCK]

# JTAG TMS引脚
set_property IOSTANDARD LVCMOS18 [get_ports jtag_TMS]
set_property PACKAGE_PIN AP37 [get_ports jtag_TMS]

# JTAG TDI引脚
set_property IOSTANDARD LVCMOS18 [get_ports jtag_TDI]
set_property PACKAGE_PIN AH33 [get_ports jtag_TDI]

# JTAG TDO引脚
set_property IOSTANDARD LVCMOS18 [get_ports jtag_TDO]
set_property PACKAGE_PIN AJ30 [get_ports jtag_TDO]

## SPI MISO引脚
#set_property IOSTANDARD LVCMOS18 [get_ports spi_miso]
#set_property PACKAGE_PIN M12 [get_ports spi_miso]

## SPI MOSI引脚
#set_property IOSTANDARD LVCMOS18 [get_ports spi_mosi]
#set_property PACKAGE_PIN AJ31 [get_ports spi_mosi]

## SPI SS引脚
#set_property IOSTANDARD LVCMOS18 [get_ports spi_ss]
#set_property PACKAGE_PIN K14 [get_ports spi_ss]

## SPI CLK引脚
#set_property IOSTANDARD LVCMOS18 [get_ports spi_clk]
#set_property PACKAGE_PIN AG34 [get_ports spi_clk]

set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property CONFIG_MODE SPIx4 [current_design]

