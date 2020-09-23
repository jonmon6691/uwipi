#!/bin/sh

echo -n "SSID: " && read ssid
echo -n "Password: " && read -s psk 
wpa_passphrase $ssid $psk
