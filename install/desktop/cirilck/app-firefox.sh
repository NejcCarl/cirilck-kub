#!/bin/bash

# TODO now check
# script to replace the default snap version with "faster" apt version
sudo rm -rf snap/firefox/

sudo add-apt-repository ppa:mozillateam/ppa
sudo add-apt-repository -y ppa:mozillateam/ppa
sudo apt update
echo '
Package: firefox*
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 1001
' | sudo tee /etc/apt/preferences.d/mozilla-firefox

sudo snap remove firefox
sudo apt install -y firefox
