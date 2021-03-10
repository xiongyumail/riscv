#!/bin/bash
IMAGE_NAME="riscv"
IMAGE_VERSION="1.0.0"

WORK_PATH=$(cd $(dirname $0); pwd)
echo "WORK_PATH: ${WORK_PATH}"

export PROJECTS_PATH=/home/${MY_NAME}/projects

session=${MY_NAME}

tmux has-session -t $session >/dev/null 2>&1
if [ $? = 0 ];then
    tmux attach-session -t $session
    exit
fi

tmux new-session -d -s $session -n chip_test
tmux split-window -t $session:0 -h
tmux split-window -t $session:0 -v
tmux split-window -t $session:0.0 -v

tmux send-keys -t $session:0.0 'cd ${PROJECTS_PATH};/bin/bash sim.sh' C-m
tmux send-keys -t $session:0.1 'cd ${PROJECTS_PATH};/bin/bash openocd.sh' C-m
tmux send-keys -t $session:0.2 'cd ${PROJECTS_PATH};/bin/bash serial.sh' C-m
tmux send-keys -t $session:0.3 'cd ${PROJECTS_PATH};/bin/bash test.sh' C-m

tmux select-pane -t $session:0.3
tmux attach-session -t $session