#!/bin/bash

#### DESCRIPTION ####
#
#  This script allow you to create a dump file for glpi. You must run this script on the glpi server.
#
####

#### REQUIREMENTS ####
#
# - mysqldump
#
####

#### VARIABLE ####

source .env

#### TEMPLATE FOR ENV FILE ####
#
# DB_USER=
# DB=
# DB_PASSWD=
#
####

OLD=$(date +"%Y-%m-%d" -d "1 day ago")
DATE=$(date +"%Y-%m-%d")
GLPI_DIR="/var/www/html/glpi/"

#### SCRIPT ####

rm -rf /tmp/$OLD/

mkdir -p /tmp/$DATE/glpi

cp -r $GLPI_DIR* /tmp/$DATE/glpi

mysqldump -h 127.0.0.1 -u $DB_USER -p$DB_PASSWD --add-drop-database --hex-blob --dump-date --verbose --routines --triggers --events --quick --skip-lock-tables $DB > /tmp/$DATE/$DB.sql

#### IMPORT SQL BACKUP ####
#
# You have to create the glpi database before importing the backup :
#
# CREATE DATABASE <db_name>;
#
# Then, run the following command to import the backup :
#
# mysql -u <user> -h <host> -p <db_name> < /tmp/backup.sql
#
####

#### IMPORT BACKUP ####
#
# cp -a /tmp/2022-11-19/glpi/* /var/www/html/glpi/
#
# chown -R www-data:www-data /var/www/html/glpi/
#
####
