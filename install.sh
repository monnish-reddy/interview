#!/bin/bash

user=($ id -u)
if [ $user -ne 0 ]
then 
    echo "Please run script using root access"
    exit 1
else
    echo "You are runnig script with sudo access"
fi

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo " $2 .....is FAILURE "
    else
        echo "$2 .....is SCUCCESS"
    fi
}

echo "please enter the package to install"
read package

dnf list installed $package
if [$? -ne 0 ]
then 
    echo "the $package is going to install"
    dnf install $package -y
    VALIDATE $? "installing $package"
else
    echo "Package is already installed nothing to do"
fi
    




