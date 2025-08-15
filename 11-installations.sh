#!/bin/bash
USERID=$(id -u)
echo "UserID is $USERID"

if [ $USERID -ne 0 ]
then
   echo "Please proceed with install"
fi

dnf install git -y
