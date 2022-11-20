#! /usr/bin/bash

dir="/backups/backup_volumes/"
target_dir="/volums/"

echo "Enter the backup volume folder name you want to use:"

ls $dir
read folder_name

docker stop $(docker ps -a -q)
rm -rf $target_dir
cp -rp $dir$folder_name /$folder_name
mv /$folder_name $target_dir
docker start $(docker ps -a -q)
