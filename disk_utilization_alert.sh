#!/bin/bash
USERID=$(id -u)
SCRIPT_NAME=$(echo $0|cut -d '.' -f1)
LOGS_FOLDER="/var/log/monnishlogs"
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER

echo " $LOG_FILE"
