#!/bin/bash -eux

apt-get install -y \
        build-essential \
        cmake \
        curl \
        emacs \
        g++-multilib \
        git \
        gcc-msp430 \
        mosquitto-clients \
        python3-pip \
        socat \
        vim \
        #

ARM_GCC_URL="https://developer.arm.com/-/media/Files/downloads/gnu-rm"
ARM_GCC_VERSION="7-2018q2"
ARM_GCC_ARCHIVE="gcc-arm-none-eabi-7-2018-q2-update-linux.tar.bz2"
ARM_GCC_ARCHIVE_URL="${ARM_GCC_URL}/${ARM_GCC_VERSION}/${ARM_GCC_ARCHIVE}"

cd /opt && wget -nv -O - "${ARM_GCC_ARCHIVE_URL}" | tar -jxf -

cat << EOF > /opt/riot.source
# RIOT specific environment variables
# remove '--no-gpg-sign' not handled by git version
export GITAMFLAGS="--ignore-whitespace"
# ARM gcc7 toolchain install path
export PATH=/opt/gcc-arm-none-eabi-7-2018-q2-update/bin:\$PATH
EOF

# IoT-LAB CLI tools
pip3 install iotlabwscli iotlabsshcli iotlabcli

# IoT-LAB Plot OML tools
pip3 install --no-cache git+https://github.com/iot-lab/oml-plot-tools.git@0.7.0

# Python tools
pip3 install aiocoap paho-mqtt pyserial cbor ed25519

# Jupyter
pip3 install jupyter jupyterlab

# GNU Radio
apt-get install -y gnuradio gr-osmosdr

cd /home/${VM_USERNAME} && git clone https://github.com/iot-lab/iot-lab.git

# IOTLAB_LOGIN environment variable
cat << EOF >> /home/${VM_USERNAME}/.bashrc
export IOTLAB_LOGIN
EOF
