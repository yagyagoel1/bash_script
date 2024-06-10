#!/bin/bash


package=htopppppp

sudo apt install $package
if [ $? -eq 0 ]
then 
echo "the installation of $package was successful"
echo  "the new command is avaliable here:"
which $package
else
 echo "$package failed to install "
fi
 
