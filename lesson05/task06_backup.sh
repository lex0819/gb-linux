lex@gblex:/home$ ls -l
total 24
drwxr-x--- 19 lex  lex   4096 июн 13 22:30 lex
-rw-r--r--  1 root root 20480 июн 13 23:01 z
lex@gblex:/home$ sudo mkdir backups
lex@gblex:/home$ ls -l
total 28
drwxr-xr-x  2 root root  4096 июн 13 23:11 backups
drwxr-x--- 19 lex  lex   4096 июн 13 22:30 lex
-rw-r--r--  1 root root 20480 июн 13 23:01 z
lex@gblex:/home$ sudo chmod 1777 backups
lex@gblex:/home$ ls -l
total 28
drwxrwxrwt  2 root root  4096 июн 13 23:11 backups
drwxr-x--- 19 lex  lex   4096 июн 13 22:30 lex
-rw-r--r--  1 root root 20480 июн 13 23:01 z
lex@gblex:/home$


lex@gblex:/home/backups$ cd ~
lex@gblex:~$ ls -l
total 56
-rw-rw-r-- 1 lex  lex       1 июн 12 10:20 12.txt
drwxrwxr-x 2 lex  lex    4096 июн 13 23:44 bash_scripts
drwxr-xr-x 2 lex  lex    4096 июн 11 23:13 Desktop
drwxr-xr-x 2 lex  lex    4096 июн 11 23:13 Documents
drwxr-xr-x 2 lex  lex    4096 июн 12 12:15 Downloads
drwxrwxr-x 2 lex  lex    4096 июн 13 19:21 logs
drwxr-xr-x 2 lex  lex    4096 июн 11 23:13 Music
drwxr-xr-x 2 lex  lex    4096 июн 11 23:13 Pictures
drwxr-xr-x 2 lex  lex    4096 июн 11 23:13 Public
drwxrwx--- 1 root vboxsf 8192 июн 11 22:35 shared
drwx------ 5 lex  lex    4096 июн 13 18:34 snap
drwxr-xr-x 2 lex  lex    4096 июн 11 23:13 Templates
drwxr-xr-x 2 lex  lex    4096 июн 11 23:13 Videos
lex@gblex:~$


lex@gblex:~$ cd bash_scripts/ && cat backup_homedir.sh
#!/bin/bash

dir="/home/backups/"

current_date=$(date +%Y-%m-%d-%H%M)

cd /home

tar  --exclude="$USER/Downloads/*" --exclude="$USER\/\.*" --exclude="$USER/snap/*" --exclude="$USER/shared/*" -zcvf "${dir}$USER${current_date}-back.tar.gz" "$HOME"

find "${dir}" -type f -mtime +30 -exec rm -rf {} \;
lex@gblex:~/bash_scripts$


lex@gblex:~/bash_scripts$ ./backup_homedir.sh
tar: Removing leading `/' from member names
/home/lex/
/home/lex/12.txt
/home/lex/Pictures/
/home/lex/logs/
/home/lex/logs/w_log.log
/home/lex/Music/
/home/lex/Videos/
/home/lex/Desktop/
/home/lex/Downloads/
/home/lex/Templates/
/home/lex/bash_scripts/
/home/lex/bash_scripts/backup_homedir.sh
/home/lex/snap/
/home/lex/Public/
/home/lex/shared/
/home/lex/Documents/
lex@gblex:~/bash_scripts$


lex@gblex:~/bash_scripts$ cd ../..
lex@gblex:/home$ ls -l
total 28
drwxrwxrwt  2 root root  4096 июн 13 23:49 backups
drwxr-x--- 18 lex  lex   4096 июн 13 23:21 lex
-rw-r--r--  1 root root 20480 июн 13 23:01 z
lex@gblex:/home$


lex@gblex:/home$ ls -l backups/
total 4
-rw-rw-r-- 1 lex lex 2710 июн 13 23:49 lex2023-06-13-2349-back.tar.gz
lex@gblex:/home$


lex@gblex:/home$ cd ~
lex@gblex:~$ crontab -e
crontab: installing new crontab
lex@gblex:~$

0 17 * * */5 /home/lex/bash_scripts/backup_homedir.sh