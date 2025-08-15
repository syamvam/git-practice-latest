#!/bin/bash
USERID=$(id -u)
echo "UserID is $USERID"

VALIDATE (){
    echo "exit status: $1"
}

if [ $USERID -ne 0 ]
then
   echo "Please run the script with root privileges"
   exit 1
fi

dnf list installed git

VALIDATE $?

# if [ $? -ne 0 ]
# then
#    echo "git is not installed going to install"
#    dnf install gittt -y
#    if [ $? -ne 0 ]
#    then
#        echo "git installation is not success"
#        exit 1
#     else
#        echo "installation is success"
#     fi      
# else
#    echo "git is already installed"
# fi 

# dnf list installed mysql

# if [ $? -ne 0 ]
# then
#    echo "mysql is not installed going to install"
#    dnf install mysql -y
#    if [ $? -ne 0 ]
#    then
#       echo "mysql install is failure"
#       exit 1
#     else
#       echo "mqsql install is success"
#     fi
# else
#    echo "Mysql is already installed"        
# fi