#!/bin/bash

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
