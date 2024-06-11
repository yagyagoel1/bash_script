#!/bin/bash

release_file=/etc/os-release

if grep -q "Arch" $release_file
then
 # the host is based on arch ,run the pacman update command
sudo pacman -Syu
fi

if grep -q "Ubuntu" $release_file || grep -q "debian" $release_file
then
# the host is based on debian or ubuntu
# run teh apt version of the command
sudo apt update
sudo apt dist-upgrade
fi
~   
