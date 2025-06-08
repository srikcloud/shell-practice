#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


if [ $USERID -ne 0 ]
then
   echo -e "$R ERROR:: Please run this script with root access$N"
   exit 1 # give other than zero uto 127
else
   echo "you are running with root access"
fi

#validation function takes inputs as exit status, what command they tried to install
VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo -e "installing $2 is .... $G success$N"
    else 
        echo -e "Installing $2 is..... $R failure$N"
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
    echo -e "Nothing to do ......$Y MySQL is already installed $N"

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
    echo -e " Nothing to do ...... $Y nginx is already installed $N"

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
    echo -e "Nothing to do ..... $Y python3 is already installed"

fi

