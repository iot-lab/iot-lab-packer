Iot-LAB virtual machine 
=======================

Create a **Xubuntu 18.04 amd64** virtual machine with following features :
  * package depedencies
  * user vagrant (login=vagrant/password=vagrant)
  * git clone Iot-LAB github (in ~/vagrant/iot-lab) 
  * toolchains compilation (arm-gcc 6/7 & msp430-gcc)
  * IoT-LAB tools: CLI, SSHCLI, WSCLI
  * autologin
  * keyboard layout en/fr: shortcut CTRL+SHIFT
  * Virtualbox guest additions

Requirements
------------

**Managing VM** : 

  * Virtualbox: 

```
sudo apt-get install virtualbox (testing with 5.2)
```

  * Vagrant: (https://www.vagrantup.com/downloads.html - tested with 2.2.4)
  
``` 
wget https://releases.hashicorp.com/vagrant/2.x.x/vagrant_2.x.x_x86_64.deb
dpkg -i vagrant_2.x.x_x86_64.deb
```

**Building VM** :

  * Packer: https://www.packer.io/downloads.html (tested with 1.3.5)


Launching virtual machine
-------------------------

On Linux :
```
mkdir ~/vagrant && cd ~/vagrant
vagrant init iotlab/bionic64
```

On Windows, open a dos console (cmd.exe):
```
md vagrant 
cd vagrant
vagrant init iotlab/bionic64
```

Note : iotlab/bionic64 is a public Vagrant box file on the cloud (https://vagrantcloud.com/iotlab/boxes/bionic64)

* **Without Desktop**
 - Launch VM :
 
   ```
   vagrant up
   ```
 - Connect to the VM :
 
   ```
   vagrant ssh
   ```
 - Halt the VM :
 
   ```
   vagrant halt
   ```
* **With Desktop**
 - Edit Vagrantfile in the directory vagrant and **uncomment**
   ```
    config.vm.provider "virtualbox" do |vb|
        vb.gui = true
    end
   ```
   
 - Launch VM :
 
   ```
   vagrant up
   ```

Building virtual machine
------------------------

- Generate a Vagrant Iot-LAB box file

   ```
   git clone https://github.com/iot-lab/iot-lab-packer.git
   cd ubuntu-18.04
   packer build ubuntu-18-04.json
   ls builds/virtualbox-ubuntu-18-04-amd64.box
   mkdir ~/vagrant && cd ~/vagrant
   vagrant init
   vagrant box add iotlab IOTLAB_PACKER_REPO_PATH/ubuntu-18.04/builds/virtualbox-ubuntu-18-04-amd64.box
   vagrant box list
   ```
- Edit Vagrantfile 

  ```
  config.vm.box = "iotlab"
  ```
- Launch VM 

  ```
  vagrant up
  ```

