#!/bin/bash
USERID=$(id -u)
SCRIPT_NAME=$(echo $0|cut -d '.' -f1)
LOGS_FOLDER="/var/log/monnishlogs"
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
msg=" "

mkdir -p $LOGS_FOLDER


FILE=$(df -h | grep -v Filesystem)

while IFS= read -r line
do
    usage=$(echo $line|awk '{print $5}'|cut -d '%' -f1)
    partition=$(echo $line|awk '{print $6}')
    if [ $usage -gt 10 ]
    then 
     msg+="High disk usage on partition $partition: $usage%"$'\n'

    fi
    
done <<< $FILE
   echo " $msg" | tee -a $LOG_FILE
