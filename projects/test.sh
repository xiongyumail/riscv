WORK_PATH=$(cd $(dirname $0); pwd)

cd ${WORK_PATH}/tinyriscv/tests/example/FreeRTOS/Demo/tinyriscv_GCC
make -j4

cd ${WORK_PATH}/tinyriscv/tests/example/uart_tx
make -j4

telnet