#!/bin/bash
USERID=$(id -u)
SCRIPT_NAME= $("echo $0"|cut -d '.' -f1)
LOGS_FOLDER= /etc/vars/monnishlogs
LOG_FILE= LOGS_FOLDER/SCRIPT_NAME.log

echo " $LOG_FILE"
