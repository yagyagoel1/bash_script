#!/bin/bash

for current_number in 1 2 3 4 5 6 7 8 9 10
do 
	echo $current_number
	sleep 1
done 

echo "this is outside of the loop"

for n in {1..10}
do 
echo $n
sleep 1
done 

echo "this is outside of the for loop"

