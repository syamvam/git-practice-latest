#!bin/bash

SOURCE_DIR=$1
DESTINATION_DIR=$2
DAYS=${3:-14}

USAGE(){
    echo -e "USAGE :: sh 19-backup.sg <source> <destination> <days(optional)>"
}
#check the source dir and destinatio are provided
if [ $# -lt 2 ]
then
    USAGE
fi    
