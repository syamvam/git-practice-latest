#!/bin/bash
USERID=$(id -u)
echo "UserID is $USERID"

VALIDATE (){
    if [ $1 -ne 0 ]
    then 
        echo "$2 is Failed"
    else
        echo "$2 is Success"
    fi        
}

if [ $USERID -ne 0 ]
then
   echo "Please run the script with root privileges"
   exit 1
fi

dnf list installed git

VALIDATE $? "Listing git"

if [ $? -ne 0 ]
then
   echo "git is not installed going to install"
   dnf install gittt -y
   VALIDATE $? "Installing git"      
else
   echo "git is already installed"
fi 

dnf list installed mysql

if [ $? -ne 0 ]
then
   echo "mysql is not installed going to install"
   dnf install mysql -y
   VALIDATE $? "Installing mysql"
else
   echo "Mysql is already installed"        
fi