#!/bin/bash


################
#Author:yagyagoel1
#Date:28-06-24
#
#purpose:to print the no of a letter in a word
#
################


if [ ! $# -eq 2 ]
then

	echo " this script requires the 1 word 2 letter you want to search as the argumnets"
exit 1
fi

grep -o "$2" <<<"$1" | wc -l
#wc -l is used for counting the no of words 

