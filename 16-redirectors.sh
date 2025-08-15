#!/bin/bash
LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"

mkdir -p $LOGS_FOLDER

USERID=$(id -u)
echo "UserID is $USERID"

R="\e[31m"
G="\e[32m"
CHECK_ROOT(){
if [ $USERID -ne 0 ]
then
   echo "$R Please run the script with root privileges $N" &>>$LOG_FILE
   exit 1
fi

}
VALIDATE (){
    if [ $1 -ne 0 ]
    then 
        echo -e "$2 is $R Failed $N" &>>$LOG_FILE
    else
        echo -e "$2 is $G Success $N" &>>$LOG_FILE
    fi        
}

CHECK_ROOT


for package in $@ # $@ refers to all arguements passed to it
do
     #echo $package
     dnf list installed $package &>>$LOG_FILE
     if [ $? -ne 0 ]
     then
        echo "$package is not installed going to install" &>>$LOG_FILE
        dnf install $package -y &>>$LOG_FILE
        VALIDATE $? "Installing $package"       
     else
        echo "$package is already installed" &&>$LOG_FILE
    fi 
done