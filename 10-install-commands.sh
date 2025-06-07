#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
   echo "ERROR:: Please run this script with root access"
   exit 1 # give other than zero uto 127
else
   echo "you are running with root access"
fi

dnf install mysqladcasfsafs -y

if [ $? -eq 0 ]
then
    echo "installing MySQL is success"
else 
    echo "Installing MySQL is failure"
    #exit 1
fi



