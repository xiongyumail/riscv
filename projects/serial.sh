WORK_PATH=$(cd $(dirname $0); pwd)

python ${WORK_PATH}/tinyriscv/tools/tinyriscv_fw_downloader.py /dev/ttyUSB1 ${WORK_PATH}/tinyriscv/sdk/examples/uart_tx/uart_tx.bin

picocom /dev/ttyUSB1 -b 115200