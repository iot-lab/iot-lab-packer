IoT-LAB virtual machine
=======================

Create a **Ubuntu 18.04 amd64** virtual machine with following features:
- all package dependencies are installed
- user credential: login=user/password=user
- git clone Iot-LAB github (in ~/iot-lab)
- toolchains compilation (arm-gcc 6/7 & msp430-gcc)
- IoT-LAB tools: CLI, SSHCLI, WSCLI
- autologin
- keyboard layout en/fr
- Virtualbox guest additions

Requirements
------------

**Managing VM**:

- Virtualbox:

      sudo apt-get install virtualbox (testing with 5.2)


- Vagrant: (https://www.vagrantup.com/downloads.html - tested with 2.2.4)

      wget https://releases.hashicorp.com/vagrant/2.x.x/vagrant_2.x.x_x86_64.deb
      sudo dpkg -i vagrant_2.x.x_x86_64.deb


**Building VM**:

- Packer: https://www.packer.io/downloads.html (tested with 1.3.5)


Launching virtual machine
-------------------------

Note: iotlab/iotlab-vm is a public Vagrant box file hosted on VagrantCloud
(https://vagrantcloud.com/iotlab/boxes/iotlab-vm).

- **Without Desktop**

  - Launch VM:

        vagrant up

  - Connect to the VM :

        vagrant ssh

  - Halt the VM:

        vagrant halt

- **With Desktop:**

  - Add the box:

        vagrant box add iotlab/iotlab-vm

  - Open Virtualbox and start the iotlab-vm VM


Building virtual machine
------------------------

- Generate a Vagrant Iot-LAB box file

      git clone https://github.com/iot-lab/iot-lab-packer.git
      cd iotlab-vm
      packer build iotlab-vm.json
      ls builds/iotlab-vm.box
      cd ..
      vagrant box add iotlab/iotlab-vm ./iotlab-vm/builds/iotlab-vm.box
      vagrant box list

- Launch VM

      vagrant up
