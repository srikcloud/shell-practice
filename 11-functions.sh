#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
   echo "ERROR:: Please run this script with root access"
   exit 1 # give other than zero uto 127
else
   echo "you are running with root access"
fi

VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo "installing $2 is success"
    else 
        echo "Installing $2 is failure"
        exit 1
    fi
}

dnf list installed mysql
# check already installed or not, if it installed $? is 0 then
# If not installed $? is not 0, expression is true
if [ $? -ne 0 ]
then
    echo "MySQL is not installed..going to install"
    dnf install mysql -y
    VALIDATE $? "MySQL"
else 
    echo "MySQL is already installed...Nothing to do"

fi

dnf list installed nginx

# check already installed or not, if it installed $? is 0 then
# If not installed $? is not 0, expression is true
if [ $? -ne 0 ]
then
    echo "nginx is not installed..going to install"
    dnf install nginx -y
    VALIDATE $? "nginix"
else 
    echo "nginx is already installed...Nothing to do"

fi

dnf list installed python3

# check already installed or not, if it installed $? is 0 then
# If not installed $? is not 0, expression is true
if [ $? -ne 0 ]
then
    echo "python3 is not installed..going to install"
    dnf install python3 -y
    VALIDATE $? "python3"
else 
    echo "python3 is already installed...Nothing to do"

fi

