#!/bin/bash

# PRINT THE BACKUP FILES
backup_dir=$(date +'%m-%d-%Y')
for entry in "${PWD}/backup"/*
do
  s3cmd put FILE $entry s3://backups.oropocket.com/backup   
done

# Create a Backup Log
touch ./backup-log/oro_log_"$backup_dir".txt

for entry in "${PWD}/backup"/*
do 
  printf "$entry \n"  >> ./backup-log/oro_log_"$backup_dir".txt
done
 
# check the file stored or not.
s3cmd ls s3://backups.oropocket.com