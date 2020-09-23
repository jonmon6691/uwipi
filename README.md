# Micro WiPi
Micro WiPi is a Wifi enabled minimum config for RPi Zero W on Buildroot

It takes the form of some minimal additional packgages added to the
buildroot defconfig and the necessary rootfs overlay.

The end result is an sd card image that will boot on a
raspberrypi zero w and be able to ping servers on the 
internet in about 12 seconds.

# Installing

```bash
# Clone this repo and cd to it
~$ git clone https://github.com/jonmon6691/uwipi.git
~$ cd uwipi

# Clone buildroot
~/uwipi$ git clone git://git.buildroot.net/buildroot

# Apply Micro WiPi to the buildroot tree, this only touches raspberrypi related stuff
~/uwipi$ ./install_uwipi.sh

# cd into buildroot and build like normal
~/uwipi$ cd buildroot
~/uwipi/buildroot$ make raspberrypi0w_defconfig

# At this point, you can customize your buildroot configuration, add packages, etc.
~/uwipi/buildroot$ make menuconfig

# Build the image, this will take a long time as it builds the tool chain, kernel, and everything else...
~/uwipi/buildroot$ make

# A flashing script is also provided
~/uwipi/buildroot$ cd ..
~/uwipi$ ./flash.sh sdc #NOTE!! replace sdc with the root device of your sd card
```

