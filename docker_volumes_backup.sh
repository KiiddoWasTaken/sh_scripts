#! /usr/bin/bash

# Add file to crontab for regular backups

dir="/backups/backup_volumes/"
target_dir="/volums"
days="+10"

cp -rp $target_dir $dir$(date +"%Y-%m-%d-%H-%M-%S")
find $dir* -mtime $days -exec rm -rf {} \;

echo "docker volumes backup complete"
