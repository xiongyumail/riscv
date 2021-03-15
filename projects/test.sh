WORK_PATH=$(cd $(dirname $0); pwd)
export PATH=$PATH:$RISCV_NONE_EMBED_GCC_PATH

cd ${WORK_PATH}/tinyriscv/sdk/examples/FreeRTOS/Demo/tinyriscv_GCC
make clean
make -j4

cd ${WORK_PATH}/tinyriscv/sdk/examples/uart_tx
make clean
make -j4

# telnet
riscv-none-embed-gdb ${WORK_PATH}/tinyriscv/sdk/examples/FreeRTOS/Demo/tinyriscv_GCC/freertos -x ${WORK_PATH}/tinyriscv/sdk/examples/gdbinit