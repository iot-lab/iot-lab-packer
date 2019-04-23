#!/bin/bash -eux

apt-get -y autoremove
apt-get -y clean

echo "cleaning up guest additions"
rm -rf VBoxGuestAdditions_*.iso VBoxGuestAdditions_*.iso.?

echo "cleaning ${VM_USERNAME} permissions"
chown -R ${VM_USERNAME}:${VM_USERNAME} /home/${VM_USERNAME}
