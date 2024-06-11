#!/bin/bash

release_file=/etc/os-release
logfile=/var/log/updater.log
errorlog=/var/log/updater_errors.log

if grep -q "Arch" $release_file
then 
	#the host is bsed on arch run teh pacman update
	sudo pacman -Syu 1>>$logfile 2>>$errorlog
	if [ $? -ne 0 ]
		then 
			echo "an error occured ,please check the $errorlog"
	fi
fi
if grep -q "Pop"  $release_file || grep -q "Ubuntu" $release_file
	# the host is based on ubuntu 
	# run teh apt version of the command 
	sudo apt update 1>>$logfile 2>>$errorlog
	if [ $? -ne 0 ] 
	then 
		echo " and error occured ,please check the $errorlog"
	fi

	sudo apt dist-upgrade -y 1>>$logfile 2>>$errorlog
	if [ $? -ne 0 ]
	then
		 echo "an erorr occured please check the $errorlog"
	fi
fi

