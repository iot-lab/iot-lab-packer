#!/bin/bash -eux

date > /etc/vagrant_box_build_time

mkdir /home/vagrant/.ssh
wget --no-check-certificate \
    'https://raw.githubusercontent.com/hashicorp/vagrant/master/keys/vagrant.pub' \
    -O /home/vagrant/.ssh/authorized_keys
chown -R vagrant /home/vagrant/.ssh
chmod -R go-rwsx /home/vagrant/.ssh
