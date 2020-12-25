WORK_PATH=$(cd $(dirname $0); pwd)

cd ${WORK_PATH}/tinyriscv/sim
python ./sim_new_nowave.py ../tests/isa/generated/rv32ui-p-add.bin inst.data
python ./test_all_isa.py

cd ${WORK_PATH}/tinyriscv/sim/compliance_test
python ./compliance_test.py ../../tests/riscv-compliance/build_generated/rv32i/I-ADD-01.elf.bin inst.data

cd ${WORK_PATH}/tinyriscv/tests/example/simple
make -j4

cd ${WORK_PATH}/tinyriscv/sim
python ./sim_new_nowave.py ../tests/example/simple/simple.bin inst.data
gtkwave tinyriscv_soc_tb.vcd