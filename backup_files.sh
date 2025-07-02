#!/bin/bash
USERID=$(id -u)
SCRIPT_NAME=$(echo $0| cut -d '.' -f1)
LOGS_FOLDER="/var/log/monnishlogs"
LOG_FILE=$LOGS_FOLDER/$SCRIPT_NAME.log

R="\e[31m]"
N="\e[0m]"

mkdir -p $LOGS_FOLDER

if [ $USERID -eq 0 ]
then    
    echo " YOU ARE RUNNING SCRIPT WITH ROOT USER "
else
    echo " PLESE RUN THE SCRIPT WITH ROOT USER"
    exit 1
fi

VALIDATE(){
    if [ $1 -eq 0 ]
    then 
        echo -e  "  $2 is success..."
    else
        echo -e  " $2 is $R failure... $N "
    fi
}

echo -p "please enter source dir to backup and delete" 
read source
echo -p "please enter the dest dir to backup"
read dest
echo -p "please enter the days "
read days

# for example source dir is /home/ec2user/source

files=$( find $source -name "*.log" -mtime +$days)
zipfile="$dest/monnish.zip"
find $source -name "*.log" -mtime +$days|zip -@ $zipfile
echo "zip file created"

while IFS= read -r line
do 
    echo "THE FILE TO  DELETE ARE $line"$'\n'
 

    rm -rf $line

done <<< $files

