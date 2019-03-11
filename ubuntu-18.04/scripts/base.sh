#!/bin/bash -eux

apt-get update
apt-get -y install linux-headers-$(uname -r) build-essential
apt-get -y install xubuntu-desktop
apt-get -y install language-pack-fr

# add vagrant user to sudoers.
echo "vagrant        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers

# disable daily apt unattended updates.
echo 'APT::Periodic::Enable "0";' >> /etc/apt/apt.conf.d/10periodic

# autologin 
echo "[SeatDefaults]" > /etc/lightdm/lightdm.conf.d/12-autologin.conf
echo "autologin-user=vagrant" >> /etc/lightdm/lightdm.conf.d/12-autologin.conf

sed -i 's/XKBLAYOUT=.*/XKBLAYOUT="us,fr"/g' /etc/default/keyboard
sed -i 's/XKBOPTIONS=.*/XKBOPTIONS="grp:ctrl_shift_toggle"/g' /etc/default/keyboard
sed -i 's/#indicators=/indicators=~session;~language;~a11y;~power/g' /etc/lightdm/lightdm-gtk-greeter.conf

echo "UseDNS no" >> /etc/ssh/sshd_config
