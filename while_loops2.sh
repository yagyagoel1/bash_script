#!/bin/bash


while [ -f ~/testfile ] 
do 
	echo "as of $(date) the test file exists"
sleep 5
done 

echo "as of $(date) the file no longer exists"

