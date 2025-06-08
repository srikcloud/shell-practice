#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/log/shellscript.logs"
SCRIPT_NAME="(echo $0.sh | cut -d "." -f1)"
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
echo "Script started executing at: $(date)" &>>$LOG_FILE

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
        echo -e "installing $2 is .... $G success$N" &>>$LOG_FILE
    else 
        echo -e "Installing $2 is..... $R failure$N" &>>$LOG_FILE
        exit 1
    fi
}

dnf list installed mysql
# check already installed or not, if it installed $? is 0 then
# If not installed $? is not 0, expression is true
if [ $? -ne 0 ]
then
    echo "MySQL is not installed..going to install" &>>$LOG_FILE
    dnf install mysql -y &>>$LOG_FILE
    VALIDATE $? "MySQL"
else 
    echo -e "Nothing to do ......$Y MySQL is already installed $N" &>>$LOG_FILE

fi

dnf list installed nginx &>>$LOG_FILE

# check already installed or not, if it installed $? is 0 then
# If not installed $? is not 0, expression is true
if [ $? -ne 0 ]
then
    echo "nginx is not installed..going to install" &>>$LOG_FILE
    dnf install nginx -y &>>$LOG_FILE
    VALIDATE $? "nginix"
else 
    echo -e " Nothing to do ...... $Y nginx is already installed $N" &>>$LOG_FILE

fi

dnf list installed python3 &>>$LOG_FILE

# check already installed or not, if it installed $? is 0 then
# If not installed $? is not 0, expression is true
if [ $? -ne 0 ]
then
    echo "python3 is not installed..going to install" &>>$LOG_FILE
    dnf install python3 -y &>>$LOG_FILE
    VALIDATE $? "python3"
else 
    echo -e "Nothing to do ..... $Y python3 is already installed" &>>$LOG_FILE

fi

