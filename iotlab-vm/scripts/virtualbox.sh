mkdir /tmp/virtualbox
VERSION=$(cat /home/${VM_USERNAME}/.vbox_version)
mount -o loop /home/${VM_USERNAME}/VBoxGuestAdditions_$VERSION.iso /tmp/virtualbox
sh /tmp/virtualbox/VBoxLinuxAdditions.run
umount /tmp/virtualbox
rmdir /tmp/virtualbox
rm /home/${VM_USERNAME}/*.iso
