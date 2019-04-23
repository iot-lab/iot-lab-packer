#!/bin/bash -eux

date > /etc/vagrant_box_build_time

mkdir /home/${VM_USERNAME}/.ssh
wget --no-check-certificate \
    'https://raw.githubusercontent.com/hashicorp/vagrant/master/keys/vagrant.pub' \
    -O /home/${VM_USERNAME}/.ssh/authorized_keys
chown -R ${VM_USERNAME} /home/${VM_USERNAME}/.ssh
chmod -R go-rwsx /home/${VM_USERNAME}/.ssh
