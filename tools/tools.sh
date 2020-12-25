#!/bin/bash
WORK_PATH=$(cd $(dirname $0); pwd)
echo "WORK_PATH: ${WORK_PATH}"

sudo apt-get update

cd ${WORK_PATH}
if [ ! -d ".config" ]; then
   mkdir .config
fi
if [ ! -d ".tools" ]; then
   mkdir .tools
fi

cd ${WORK_PATH}/.config
if [ ! -d ".config" ]; then
   mkdir .config
   rm -rf ~/.config
   sudo ln -s $PWD/.config ~/.config
fi
if [ ! -d ".vscode" ]; then
   mkdir .vscode
   rm -rf ~/.vscode
   sudo ln -s $PWD/.vscode ~/.vscode
fi
if [ ! -d ".tmux" ]; then
   mkdir .tmux
   rm -rf ~/.tmux
   sudo ln -s $PWD/.tmux ~/.tmux
fi
if [ ! -d ".local" ]; then
   mkdir .local
   rm -rf ~/.local
   sudo ln -s $PWD/.local ~/.local
fi
if [ ! -d ".ipython" ]; then
   mkdir .ipython
   rm -rf ~/.ipython
   sudo ln -s $PWD/.ipython ~/.ipython
fi
if [ ! -d ".pki" ]; then
   mkdir .pki
   rm -rf ~/.pki
   sudo ln -s $PWD/.pki ~/.pki
fi
if [ ! -d ".cache" ]; then
   mkdir .cache
   rm -rf ~/.cache
   sudo ln -s $PWD/.cache ~/.cache
fi

# iverilog
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y \
                     make \
                     cmake \
                     libtool \
                     pkg-config \
                     autoconf \
                     automake \
                     gperf \
                     flex \
                     bison \
                     build-essential \
                     python3-dev \
                     ipython3 \
                     python3-pip \
                     gtkwave
if [ ! -f "${WORK_PATH}/.tools/iverilog" ]; then
   cd ${WORK_PATH}
   cd iverilog
   sh autoconf.sh
   ./configure
   make -j4
   sudo make install
   sudo rm /usr/bin/python
   sudo ln -s /usr/bin/python3 /usr/bin/python
   echo "export IVERILOG_PATH=${WORK_PATH}/iverilog" >> ${HOME}/.bashrc
   echo "iverilog install ok" >> ${WORK_PATH}/.tools/iverilog
fi

# vscode
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y \
   libsecret-common \
   libxkbfile1 \
   libsecret-1-0 \
   libxss1 \
   libwayland-server0 \
   libnspr4 \
   libnss3 \
   libgbm1 \
   libasound2 \
   libgtk-3-0 \
   libx11-xcb-dev \
   libxcb-dri3-dev
if [ ! -f "${WORK_PATH}/.tools/vscode" ]; then
   cd ${WORK_PATH}
   sudo dpkg -i vscode/code_1.51.1-1605051630_amd64.deb
   echo "vscode install ok" >> ${WORK_PATH}/.tools/vscode
fi

# tmux
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y \
   tmux
if [ ! -f "${WORK_PATH}/.tools/tmux" ]; then
   cd ${WORK_PATH}
   cd tmux
   ln -s $PWD/.tmux.conf ~/.tmux.conf
   echo "export TMUX_PATH=${WORK_PATH}/tmux" >> ${HOME}/.bashrc
   echo "tmux install ok" >> ${WORK_PATH}/.tools/tmux
fi

# toolchain: riscv-none-embed-gcc
if [ ! -f "${WORK_PATH}/.tools/toolchain" ]; then
   cd ${WORK_PATH}
   cd toolchain
   if [! -f "xpack-riscv-none-embed-gcc-8.3.0-2.3-linux-x64.tar.gz" ]; then
      wget https://github.com/xpack-dev-tools/riscv-none-embed-gcc-xpack/releases/download/v8.3.0-2.3/xpack-riscv-none-embed-gcc-8.3.0-2.3-linux-x64.tar.gz
   fi
   
   tar zxvf xpack-riscv-none-embed-gcc-8.3.0-2.3-linux-x64.tar.gz
   echo "export RISCV_NONE_EMBED_GCC_PATH=${WORK_PATH}/toolchain/xpack-riscv-none-embed-gcc-8.3.0-2.3/bin" >> ${HOME}/.bashrc
   echo "toolchain: riscv-none-embed-gcc install ok" >> ${WORK_PATH}/.tools/toolchain
fi

sudo apt-get clean
sudo apt-get autoclean
sudo rm -rf /tmp/*
sudo rm -rf /var/tmp/*
sudo rm -rf /var/cache/*
sudo rm -rf /var/lib/apt/lists/*
