#!/bin/bash

#Update this to reflect your SD card's size
SD_CARD_SIZE=8G

if [ -z $1 ]
then
	df -h | head -n 1 1>&2
	df -h | grep -P \/sd 1>&2
	echo 1>&2
	echo "Usage: put the device name as the first argument" 1>&2
	echo "Example:" 1>&2
	echo "  $ ./flash.sh sdd" 1>&2
	exit
fi

df -h | head -n 1 1>&2
df -h | grep /dev/$1 1>&2
read -p "Check drive and press enter to continue." tmp

umount /dev/$1?
sudo dd if=buildroot/output/images/sdcard.img of=/dev/$1 bs=1M status=progress conv=fsync

sudo parted /dev/$1 resizepart 2 ${SD_CARD_SIZE}
sudo e2fsck -f /dev/$12
sudo resize2fs /dev/$12

