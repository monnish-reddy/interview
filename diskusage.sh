#!/bin/bash

USER=$(id -u)
FILE=$( df -hT| grep -v Filesystem)
THRESHOLD=1
msg=" "


if [ USER -ne 0 ]
then 
    echo "please run the script woth root user"
    exit 1
else
    echo " you are runnig the script with root user"

while IFS= read -r line 
do
    USAGE=$(echo $line |cut -d '%' -f1|awk '{ print $6F }')
    PARTITION=$(echo $line|awk '{print $7F}')
    if [ $USAGE > $THRESHOLD]
    then
        msg+="High diskusage on $PARTITION : $USAGE % <br>"
    fi
done <<< FILE