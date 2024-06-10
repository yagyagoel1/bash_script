#!/bin/bash


mynum=200

if [ ! $mynum -eq 200 ]
then
     echo "the condition is true"
else
 echo "the variable is not equal to 200"
fi
if [  $mynum -ne 200 ]
then 
   echo "the condition is not equal is true"
fi
if [ $mynum -gt 200 ] 
 then 
   echo "checks greater thann"
fi 
if [ -f ~/myfile ] 
then 
 echo "the fiel exists "
else
  echo  " teh file does not exists"
fi

