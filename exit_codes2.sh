#!/bin/bash

package=notexist

sudo apt install $package >> package_install_results.log

if [ $? -eq 0 ]
then 
echo "the $package exists"
echo "it is installed successfully"

else

echo "$package failed to install. " >> package_install_failed.log
fi
