#!/bin/bash
echo "ctrl_interface=/var/run/wpa_supplicant" > wpa_supplicant.conf
echo "update_config=1" >> wpa_supplicant.conf
echo -n "SSID: " && read ssid
echo -n "Password: " && read -s psk 

wpa_passphrase $ssid $psk | sed '/^\s*#/d' >> wpa_supplicant.conf

echo

cp wpa_supplicant.conf rootfs_overlay/etc/ && echo "Updated: rootfs_overlay/etc/wpa_supplicant.conf"
cp wpa_supplicant.conf buildroot/board/raspberrypi0w/rootfs_overlay/etc/ && echo "Updated: buildroot/board/raspberrypi0w/rootfs_overlay/etc/wpa_supplicant.conf"

rm wpa_supplicant.conf
