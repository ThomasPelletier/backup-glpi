#!/bin/bash

#### DESCRIPTION ####
#
#  This script allow you to create a dump file for glpi. You must run this script on the glpi server.

#### REQUIREMENTS ####
#
# - mysqldump

#### VARIABLE ####

source .env

#### TEMPLATE FOR ENV FILE ####
#
# DB_USER=
# DB=
# DB_PASSWD=

DATE=$(date +"%Y-%m-%d")
GLPI_DIR="/var/www/html/glpi/"
BACKUP_DIR="/backup/"

#### SCRIPT ####

mkdir /tmp/$DATE/

cp -r $GLPI_DIR /tmp/$DATE/

mysqldump -u$DB_USER -p$DB_PASSWD -h localhost --database $DB > /tmp/$DATE/$DB.sql
