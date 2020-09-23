#!/bin/sh

echo "Installing Micro WiPi on buildroot..."
echo -n "Patching raspberrypi0w_defconfig... "
#TODO: Make this a patch apply
cat uwipi_buildroot.config >> buildroot/configs/raspberrypi0w_defconfig
echo "OK"

echo -n "Installing rootfs_overlay... "
cp -r rootfs_overlay buildroot/board/raspberrypi0w/
echo "OK"


