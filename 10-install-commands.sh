#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
   echo "ERROR:: Please run this script with root access"
   exit 1 # give other than zero uto 127
else
   echo "you are running with root access"
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "MySQL is not installed..going to install"
    dnf install mysql -y

if [ $? -eq 0 ]
then
    echo "installing MySQL is success"
else 
    echo "Installing MySQL is failure"
  fi
else 
    echo "MySQL is already installed...Nothing to do"
    exit 1
fi

# dnf install mysql -y

# if [ $? -eq 0 ]
# then
#     echo "installing MySQL is success"
# else 
#     echo "Installing MySQL is failure"
#     exit 1
# fi



