#!/bin/bash

### First run script! ###
if ! [ -d "/home/$USERNAME" ]; then

### Prepare a user for the server ###
useradd -m $USERNAME
echo "$USERNAME:$PASSWORD" | chpasswd
usermod -a -G sudo $USERNAME
chsh -s /bin/zsh $USERNAME

mkdir -p /home/$USERNAME/.config
mv /i3 /home/$USERNAME/.config/
mv /i3status /home/$USERNAME/.config/

chown -R $USERNAME:$USERNAME /home/$USERNAME/.config

else

### Make sure DBUS and xrdp-sesman run ###
if [ -f "/run/dbus/pid" ]; then
rm /run/dbus/pid
fi

if [ ! -d "/run/dbus" ]; then
mkdir -p /run/dbus
fi

dbus-daemon --system

if [ -f "/var/run/xrdp-sesman.pid" ]; then
rm /var/run/xrdp-sesman.pid
fi

xrdp-sesman
xrdp --nodaemon
fi