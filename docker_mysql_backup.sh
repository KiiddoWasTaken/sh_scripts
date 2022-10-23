#! /usr/bin/bash

# I will add to crontab for regular backups

dir="/backups/backup_files/"
user="root"
passwd=".123456aA."
container="wpdb"
db="mysql_db_sds"
days="+10

# Getting in the mysql container and dumping out file with date to host 
docker exec -i $container mysqldump -u $user --password=$passwd $db > $dir$(date +"%Y-%m-%d-%H-%M-%S").sql
# Deletes backups from x days old
find $dir -type f -mtime $days -delete

echo "mysql_db_sds backup complete."
