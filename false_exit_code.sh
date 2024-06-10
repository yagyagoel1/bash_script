#!/bin/bash

directory=/notexits

if [ -d $directory ] 
then 
	echo "THe directory $directory exists"
else
echo "the directory $directory doesnt exist"
fi


echo "the exit code for this script now will be 0 : $?"
echo "it is becausse we need to check the exit code exactly after the command for which we want to check else it will show that of the last command "

echo "or we can use exit keyword and the code check the code below "

directory=/etc

if [ -d $directory ]

then
        echo "THe directory $directory exists"
exit 0
else
echo "the directory $directory doesnt exist"
exit 199
fi
echo  "u are not going to get here as when we use keyword exit we get exited from the script and teh rest of the script is not going to run it help us evaluate what was the problem "

