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

if [! -d SOURCE_DIR ]
then
    echo "$SOURCE_DIR does not exists please check"
fi

if [! -d DESTINATION_DIR ]
then
    echo "$DESTINATION_DIR does not exists please check"
fi

FILES=$(find ${SOURCE_DIR} -name "*.log" -mtime +14)

echo "Files:$FILES"

if [ ! -z $FILES ]
then
    echo "files are found"
else
    echo "No Files older than $DAYS"
fi       
    
