#!/bin/bash

mongodump=/opt/mongodb/bin/mongodump
# eg: 127.0.0.1:27017
db_host=$1
date=`date -I`
backup_dir="/data/backup/mongo/${date}"

if [ ! -d $backup_dir ]
then
	mkdir -p $backup_dir
fi

$mongodump --host $db_host -o $backup_dir
