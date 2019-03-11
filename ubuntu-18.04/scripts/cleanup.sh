#!/bin/bash -eux

apt-get -y autoremove
apt-get -y clean
apt-get -y upgrade

echo "cleaning up guest additions"
rm -rf VBoxGuestAdditions_*.iso VBoxGuestAdditions_*.iso.?

echo "cleaning vagrant permissions"
chown -R vagrant:vagrant /home/vagrant

