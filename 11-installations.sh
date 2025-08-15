#!/bin/bash
USERID=$(id -u)
echo "UserID is $USERID"

if [ $USERID -ne 0 ]
then
   echo "Please run the script with root privileges"
   exit 1
fi

dnf list installed git

if [ $? -ne 0 ]
then
   echo "git is not installed going to install"
   dnf install gittt -y
   if [ $? -ne 0 ]
   then
       echo "git installation is not success"
       exit 1
    else
       echo "installation is success"
    fi      
else
   echo "git is already installed"
fi   
