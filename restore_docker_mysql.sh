#! /usr/bin/bash

dir="/backups/backup_files/"
user="root"
passwd=".123456aA."
container="wpdb"
db="mysql_db_sds"

echo "Enter the backup file name you want to use:"

ls $dir
read file_name
# Enters mysql container, indicates db name and restores from selected host file
docker exec -i $container mysql -u $user --password=$passwd $db < $dir$file_name

# If wordpress db was fully deleted, create db with same name on container first and then restore.
