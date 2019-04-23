#!/bin/bash -eux

apt-get update
apt-get -y upgrade
apt-get -y install linux-headers-$(uname -r) ubuntu-desktop language-pack-fr

# Remove welcome wizard
apt-get -y remove gnome-initial-setup

# Remove Amazon, etc launchers
apt -y purge ubuntu-web-launchers

# Fix locale setup
locale-gen
localectl set-locale LANG="en_US.UTF-8"

# Customize launchers
sudo -u ${VM_USERNAME} dbus-launch gsettings set org.gnome.shell favorite-apps \
    "['firefox.desktop', \
      'org.gnome.Nautilus.desktop', \
      'gnome-terminal.desktop', \
      'gedit.desktop', \
      'vim.desktop', \
      'emacs25.desktop']"

# Disable lock screen and screensaver
sudo -u ${VM_USERNAME} dbus-launch gsettings set org.gnome.desktop.session idle-delay 0
sudo -u ${VM_USERNAME} dbus-launch gsettings set org.gnome.desktop.lockdown disable-lock-screen true
sudo -u ${VM_USERNAME} dbus-launch gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-timeout 0
sudo -u ${VM_USERNAME} dbus-launch gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-timeout 0
sudo -u ${VM_USERNAME} dbus-launch gsettings set org.gnome.settings-daemon.plugins.power idle-dim false
sudo -u ${VM_USERNAME} dbus-launch gsettings set org.gnome.desktop.screensaver idle-activation-enabled false
sudo -u ${VM_USERNAME} dbus-launch gsettings set org.gnome.desktop.screensaver lock-enabled false

# Disable software-update pop-up
sudo -u ${VM_USERNAME} dbus-launch gsettings set com.ubuntu.update-notifier no-show-notifications true
sudo -u ${VM_USERNAME} dbus-launch gsettings set com.ubuntu.update-notifier regular-auto-launch-interval 3650
sudo -u ${VM_USERNAME} dbus-launch gsettings set com.ubuntu.update-manager launch-time 1900000000

# enable sudo without password
echo '%sudo   ALL=(ALL:ALL) NOPASSWD:ALL' >> /etc/sudoers

# disable daily apt unattended updates.
echo 'APT::Periodic::Enable "0";' >> /etc/apt/apt.conf.d/10periodic

# autologin 
cp /etc/gdm3/custom.conf /etc/gdm3/custom.conf.bak
echo "[daemon]" > /etc/gdm3/custom.conf
echo "AutomaticLoginEnable = true" >> /etc/gdm3/custom.conf
echo "AutomaticLogin = ${VM_USERNAME}" >> /etc/gdm3/custom.conf
echo "[security]" >> /etc/gdm3/custom.conf
echo "[xdmcp]" >> /etc/gdm3/custom.conf
echo "[chooser]" >> /etc/gdm3/custom.conf
echo "[debug]" >> /etc/gdm3/custom.conf

# Keyboard layouts
sed -i 's/XKBLAYOUT=.*/XKBLAYOUT="us,fr"/g' /etc/default/keyboard

echo "UseDNS no" >> /etc/ssh/sshd_config

# Remove default directories in home
echo "" > /etc/xdg/user-dirs.defaults
echo 'XDG_DESKTOP_DIR="$HOME"' > /home/${VM_USERNAME}/.config/user-dirs.dirs
