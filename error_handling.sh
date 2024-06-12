#!/bin/bash
if [ $# -ne 1 ]
then 
	echo "we need the folder name "

	exit 2
fi

create_directory(){
mkdir $1
}

if [ ! create_directory ] 
then 
echo "teh code is being exited as the directory already exist"
exit 1
fi


echo "problem not occured"
