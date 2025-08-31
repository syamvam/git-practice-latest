#!bin/bash

SOURCE_DIR=$1
DESTINATION_DIR=$2
DAYS=${3:-14}
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)

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

if [ ! -z $FILES ] #true if FILES is empty, ! nakes it expression false
then
    echo "Files are found"
    ZIP_FILE="$DEST_DIR/app-logs-$TIMESTAMP.zip"
    find ${SOURCE_DIR} -name "*.log" -mtime +$DAYS | zip "$ZIP_FILE" -@

    #check if zip file is successfully created or not
    if [ -f $ZIP_FILE ]
    then
        echo "Successfully zippped files older than $DAYS"
        #remove the files after zipping
        while IFS= read -r file #IFS,internal field seperatpor, empty it will ignore while space.-r is for not to ingore special charecters like /
        do
            echo "Deleting file: $file"
            rm -rf $file
        done <<< $FILES
    else
        echo "Zipping the files is failed"
        exit 1
    fi
else
    echo "No files older than $DAYS"
fi       
    
