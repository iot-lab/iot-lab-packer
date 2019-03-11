#!/bin/bash -eux

apt-get -y install cmake curl git 
apt-get -y install gcc-arm-none-eabi gcc-msp430
apt-get -y install vim emacs
apt-get -y install python-setuptools
apt-get -y install python-argparse python-pip
apt-get -y install mosquitto-clients

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

cd /home/vagrant && git clone https://github.com/iot-lab/iot-lab.git

pip install iotlabwscli
pip install iotlabsshcli
pip install iotlabcli
