#!/bin/bash

if [ $# -ne 3 ]
then 
	echo "the script requires exactly 3 argument passed to it "
	echo " please try again "
	exit 1

fi

echo "you entered the argument: $1 , $2 , $3"
