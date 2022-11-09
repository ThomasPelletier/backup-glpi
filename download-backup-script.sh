#!/bin/bash

## REQUIREMENTS
#
# - configure an ssh config file

DATE=$(date +"%Y-%m-%d")
GLPI_DIR="/var/www/html/glpi/"
MYSQL_DIR="/var/lib/mysql/"
HOST="glpi-ydays"
LOCAL_DIR="/home/backup/"

## SCRIPT

mkdir /tmp/$DATE/

scp -r $HOST:$GLPI_DIR /tmp/$DATE/
scp -r $HOST:$MYSQL_DIR /tmp/$DATE/

tar -czf $LOCAL_DIR$DATE.tar.gz /tmp/$DATE/

rm -rf /tmp/$DATE/
