#!/bin/bash

#######################
# Author: Yagya 
# Date : 27-06-24
#
# this script ooutputs the node health 
#
# version:v1
#######################

set -x #debug mode
set -e #exit the script when there si an error 
set -o pipefail #it exit when one element of pipe command fails

# echo "print the spc
df -h 

#echo "print the memory "
free -g 

#echo "print the cpu"
nproc


ps -ef 


