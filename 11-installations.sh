#!/bin/bash
USERID=$(id -u)
echo "UserID is $USERID"

if [ $USERID -ne 0 ]
then
   echo "Please run the script with root privileges"
   exit 1
fi

dnf list installed gittt

if [ $? -ne 0 ]
then
   echo "git is not installed going to install"
   dnf install git -y
   if [ $? -ne 0 ]
   then
      echo "git installation is not success"
      exit 1
   else
      echo "installation is success"   
else
   echo "git is already installed"
fi   
