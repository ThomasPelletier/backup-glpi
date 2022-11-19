#!/bin/bash

## REQUIREMENTS
#
# - configure an ssh config file
#
####

DATE=$(date +"%Y-%m-%d")
HOST="glpi-ydays"
LOCAL_DIR="/home/backup/"

## SCRIPT

mkdir /tmp/$DATE/

scp -r $HOST:/tmp/$DATE/ /tmp/$DATE/

tar -czf $LOCAL_DIR$DATE.tar.gz /tmp/$DATE/

rm -rf /tmp/$DATE/
