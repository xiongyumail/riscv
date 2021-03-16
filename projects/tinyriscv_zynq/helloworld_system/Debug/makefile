#
# This file was created by Xilinx Vitis tool.
#


#
# tools
#

RM = rm -f
RMDIR = rm -rf



#
# variables
#

SDCARD_GEN = sdcard_gen
GENERATE_BIF = ::scw::generate_bif

XPFM_PATH = /home/vitis/projects/tinyriscv_zynq/riscv_zynq/export/riscv_zynq/riscv_zynq.xpfm
SYS_CONFIG = riscv_zynq
DOMAINS = standalone_domain
BIF_PATH = /home/vitis/projects/tinyriscv_zynq/helloworld_system/Debug/system.bif

BITSTREAM_PATH = /home/vitis/projects/tinyriscv_zynq/helloworld/_ide/bitstream/design_1_wrapper.bit
SD_FILES = --elf /home/vitis/projects/tinyriscv_zynq/helloworld/Debug/helloworld.elf,ps7_cortexa9_0

GENERATE_BIF_XSCT_CMD = ${GENERATE_BIF} -xpfm ${XPFM_PATH} -domains ${DOMAINS} -bifpath ${BIF_PATH}

#
# primary build targets
#

all: package

package:
	-@echo Generating bif file for the system project
	-@echo Executing command \'${GENERATE_BIF_XSCT_CMD}\' on XSCT
	-@echo "connect -u TCP:localhost:40581; tcf send_command $$::xsdb::curchan xsdb eval s es [list \"${GENERATE_BIF_XSCT_CMD}\"]" | xsct
	${SDCARD_GEN} --xpfm ${XPFM_PATH} --sys_config ${SYS_CONFIG} --bif ${BIF_PATH} --bitstream ${BITSTREAM_PATH} ${SD_FILES}

clean:
	$(RMDIR) ./_sds
	${RMDIR} package
	${RM} system.bif

.PHONY: all package clean


