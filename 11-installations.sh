#!/bin/bash
USERID=$(id -u)
echo "UserID is $USERID"

if [ $USERID -ne 0 ]
then
   echo "Please run the script with root privileges"
   exit 1
fi

dnf install git -y

