#!/bin/bash
release_file=/etc/os-release
errorlog=/var/log/updater_errors.log
log_file=/var/log/updater.log
check_exit_status(){
	if [  $? -ne 0 ] 
	then 
		echo "an error occured please check $errorlog"
	fi
}

if grep -q "Pop" $release_file || grep -q "debian" $release_file
then 
	sudo apt update -y 1>>$log_file 2>>$errorlog
	check_exit_status
fi

