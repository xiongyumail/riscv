WORK_PATH=$(cd $(dirname $0); pwd)

openocd -f ${WORK_PATH}/tinyriscv/tools/openocd/tinyriscv_ftdi.cfg