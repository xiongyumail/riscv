#!/bin/bash
WORK_PATH=$(cd $(dirname $0); pwd)
TEMP_PATH=~/workspace/.tmp/${MY_NAME}
echo "WORK_PATH: ${WORK_PATH}"
echo "TEMP_PATH: ${TEMP_PATH}"

sudo apt-get update

if [ ! -d "${TEMP_PATH}" ]; then
   mkdir -p ${TEMP_PATH}
fi
cd ${TEMP_PATH}
if [ ! -d ".config" ]; then
   mkdir .config
fi
if [ ! -d ".tools" ]; then
   mkdir .tools
fi

cd ${TEMP_PATH}/.config
if [ ! -d ".config" ]; then
   mkdir .config
   sudo rm -rf ~/.config
   sudo ln -s $PWD/.config ~/.config
fi
if [ ! -d ".tmux" ]; then
   mkdir .tmux
   sudo rm -rf ~/.tmux
   sudo ln -s $PWD/.tmux ~/.tmux
fi
if [ ! -d ".local" ]; then
   mkdir .local
   sudo rm -rf ~/.local
   sudo ln -s $PWD/.local ~/.local
fi
if [ ! -d ".ipython" ]; then
   mkdir .ipython
   sudo rm -rf ~/.ipython
   sudo ln -s $PWD/.ipython ~/.ipython
fi
if [ ! -d ".pki" ]; then
   mkdir .pki
   sudo rm -rf ~/.pki
   sudo ln -s $PWD/.pki ~/.pki
fi
if [ ! -d ".cache" ]; then
   mkdir .cache
   sudo rm -rf ~/.cache
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

pip3 install pyserial
if [ ! -f "${TEMP_PATH}/.tools/iverilog" ]; then
   cd ${TEMP_PATH}
   cp -r ${WORK_PATH}/iverilog ${TEMP_PATH}/
   cd iverilog
   sh autoconf.sh
   ./configure
   make -j4
   sudo make install
   sudo rm /usr/bin/python
   sudo ln -s /usr/bin/python3 /usr/bin/python
   echo "export IVERILOG_PATH=${TEMP_PATH}/iverilog" >> ${HOME}/.bashrc
   echo "iverilog install ok" >> ${TEMP_PATH}/.tools/iverilog
fi

# tmux
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y \
                     picocom \
                     tmux
if [ ! -f "${TEMP_PATH}/.tools/tmux" ]; then
   cd ${WORK_PATH}
   cd tmux
   ln -s $PWD/.tmux.conf ~/.tmux.conf
   echo "export TMUX_PATH=${TEMP_PATH}/tmux" >> ${HOME}/.bashrc
   echo "tmux install ok" >> ${TEMP_PATH}/.tools/tmux
fi

# toolchain: riscv-none-embed-gcc
if [ ! -f "${TEMP_PATH}/.tools/toolchain" ]; then
   cd ${TEMP_PATH}
   if [ ! -d "toolchain" ]; then 
      mkdir toolchain
   fi
   cd toolchain
   if [ ! -f "xpack-riscv-none-embed-gcc-8.3.0-2.3-linux-x64.tar.gz" ]; then
      wget https://github.com/xpack-dev-tools/riscv-none-embed-gcc-xpack/releases/download/v8.3.0-2.3/xpack-riscv-none-embed-gcc-8.3.0-2.3-linux-x64.tar.gz
   fi
   
   tar zxvf xpack-riscv-none-embed-gcc-8.3.0-2.3-linux-x64.tar.gz
   echo "export RISCV_NONE_EMBED_GCC_PATH=${TEMP_PATH}/toolchain/xpack-riscv-none-embed-gcc-8.3.0-2.3/bin" >> ${HOME}/.bashrc
   echo "toolchain: riscv-none-embed-gcc install ok" >> ${TEMP_PATH}/.tools/toolchain
fi

# riscv-openocd
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y \
                     texinfo \
                     libusb-1.0 \
                     telnet
if [ ! -f "${TEMP_PATH}/.tools/riscv-openocd" ]; then
   cd ${WORK_PATH}
   cd riscv-openocd
   ./bootstrap
   ./configure
   make -j4 
   sudo make install
   cp -r ${WORK_PATH}/riscv-openocd ${TEMP_PATH}/
   echo "export RISCV_OPENOCD_PATH=${TEMP_PATH}/riscv-openocd" >> ${HOME}/.bashrc
   echo "riscv-openocd install ok" >> ${TEMP_PATH}/.tools/riscv-openocd
fi

sudo apt-get clean
sudo apt-get autoclean
sudo rm -rf /tmp/*
sudo rm -rf /var/tmp/*
sudo rm -rf /var/cache/*
sudo rm -rf /var/lib/apt/lists/*
