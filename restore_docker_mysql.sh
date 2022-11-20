#! /usr/bin/bash

dir="/backups/backup_files/"
user="root"
passwd=".123456aA."
container="wpdb"
db="mysql_db_sds"

echo "Enter the backup file name you want to use:"

ls $dir
read file_name

echo "Creating Database" $db

docker exec -i $container mysql -u $user --password=$passwd -e "DROP DATABASE "$db";"
docker exec -i $container mysql -u $user --password=$passwd -e "CREATE DATABASE "$db";"
docker exec -i $container mysql -u $user --password=$passwd $db < $dir$file_name

echo "Restore of" $db "complete."
