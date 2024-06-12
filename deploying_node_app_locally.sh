#!/bin/bash

if [ $# -ne 1 ]
then 
	echo "need the directory of github to pull the code "
	exit 1
fi

pull_code_from_github() {

	echo "pulling the  ccode ffrom github " 
	git pull $1
}
check_docker_cd_into_the_directory() {
if [ ! docker ]
	echo "docker is not installed"
exit 2
fi
url=$(($1%.git))

cd $(($url##*/))
}
build_the_image(){
	echo "building the image and running it"
	sudo docker build -t app_my .
	sudo docker run -d -p 8080:8080 app_my
}

if [ ! pull_code_from_github ]
	then 
		echo "there was some problem while pulling the code from docker"
		exit 3
fi
if [ ! check_docker_cd_into_directory ]
then
	echo "there was some issue while getting into the directory or docker is not installed or inaccessible"
	exit 4
fi
if [ ! build_the_image ] 
	then 
		echo "there was some issue while building the image  or running it"
		exit 5
fi

