connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Platform Cable USB 00000000000000" && level==0 && jtag_device_ctx=="jsn-DLC9LP-00000000000000-13722093-0"}
fpga -file /home/vitis/projects/tinyriscv_zynq/helloworld/_ide/bitstream/design_1_wrapper.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw /home/vitis/projects/tinyriscv_zynq/riscv_zynq/export/riscv_zynq/hw/design_1_wrapper.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source /home/vitis/projects/tinyriscv_zynq/helloworld/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow /home/vitis/projects/tinyriscv_zynq/helloworld/Debug/helloworld.elf
configparams force-mem-access 0
bpadd -addr &main
