#! /usr/bin/bash

# Add file to crontab for regular backups

dir="/backups/backup_volumes/"
target_dir="/volums/"
days="+10"

docker stop $(docker ps -a -q)
cp -rp $target_dir $dir$(date +"%Y-%m-%d-%H-%M-%S")
find $dir* -type d -ctime $days -exec rm -rf {} \;
docker start $(docker ps -a -q)

echo "docker volumes backup complete"
