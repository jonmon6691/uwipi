#!/bin/bash

echo "Installing Micro WiPi on buildroot..."
echo -n "Patching raspberrypi0w_defconfig... "
#TODO: Make this a patch apply
cat uwipi_buildroot.config >> buildroot/configs/raspberrypi0w_defconfig
echo "OK"

echo -n "Installing rootfs_overlay... "
cp -r rootfs_overlay buildroot/board/raspberrypi0w/
echo "OK"

if [[ ! -f rootfs_overlay/etc/wpa_supplicant.conf ]]; then
	echo "Wifi network for Raspberry Pi to connect to:"
	./configure_wifi.sh
fi

echo "Install Micro WiPi DONE"
echo "You can now cd into buildroot and run 'make raspberrypi0w_defconfig' to finish configuring buildroot."
