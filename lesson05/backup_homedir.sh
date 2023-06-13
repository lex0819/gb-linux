#!/bin/bash

dir="/home/backups/"

current_date=$(date +%Y-%m-%d-%H%M)

cd /home

tar  --exclude="$USER/Downloads/*" --exclude="$USER\/\.*" --exclude="$USER/snap/*" --exclude="$USER/shared/*" -zcvf "${dir}$USER${current_date}-back.tar.gz" "$HOME"

find "${dir}" -type f -mtime +30 -exec rm -rf {} \;
