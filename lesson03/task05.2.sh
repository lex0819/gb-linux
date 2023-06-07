# Создать группу developer и нескольких пользователей, входящих в неё. Создать директорию для совместной работы. Сделать так, чтобы созданные одними пользователями файлы могли изменять другие пользователи этой группы.

lex@lexgb:~$ pwd
/home/lex
lex@lexgb:~$ sudo groupadd developer
lex@lexgb:~$ sudo useradd -G developer dev001
lex@lexgb:~$ sudo useradd -G developer dev002
lex@lexgb:~$ tail /etc/group
testgroup:x:1003:testuser2
testgroup2:x:1001:
testuser3:x:1004:
user002:x:1006:
group001:x:1005:
group002:x:1007:user002,testuser2,testuser3
kolobok:x:1008:
developer:x:1009:dev001,dev002
dev001:x:1010:
dev002:x:1011:
lex@lexgb:~$

lex@lexgb:~$ sudo passwd dev001
New password:
Retype new password:
passwd: password updated successfully
lex@lexgb:~$ sudo passwd dev002
New password:
Retype new password:
passwd: password updated successfully
lex@lexgb:~$

lex@lexgb:~$ sudo mkdir /devShare
lex@lexgb:~$ ls -l /
total 68
lrwxrwxrwx   1 root root     7 Feb 17 17:22 bin -> usr/bin
drwxr-xr-x   5 root root  4096 Jun  5 08:59 boot
drwxr-xr-x  20 root root  4100 Jun  5 09:56 dev
drwxr-xr-x   2 root root  4096 Jun  7 09:12 devShare
drwxr-xr-x  84 root root  4096 Jun  7 09:09 etc
drwxr-xr-x   7 root root  4096 Jun  7 08:21 home
lrwxrwxrwx   1 root root     7 Feb 17 17:22 lib -> usr/lib
drwx------   2 root root 16384 May 29 09:37 lost+found
drwxr-xr-x   2 root root  4096 Feb 17 17:22 media
drwxr-xr-x   2 root root  4096 Feb 17 17:22 mnt
drwxr-xr-x   2 root root  4096 Feb 17 17:22 opt
dr-xr-xr-x 265 root root     0 May 29 15:15 proc
drwx------   6 root root  4096 Jun  7 08:24 root
drwxr-xr-x  27 root root   900 Jun  7 06:36 run
lrwxrwxrwx   1 root root     8 Feb 17 17:22 sbin -> usr/sbin
drwxr-xr-x   6 root root  4096 May 30 06:58 snap
drwxr-xr-x   2 root root  4096 Feb 17 17:22 srv
dr-xr-xr-x  13 root root     0 May 29 15:15 sys
drwxrwxrwt  13 root root  4096 Jun  7 01:28 tmp
drwxr-xr-x  11 root root  4096 Feb 17 17:22 usr

lex@lexgb:~$ sudo chmod g+ws /devShare
lex@lexgb:~$ ls -la / | grep devShare
drwxrwsr-x   2 root root  4096 Jun  7 09:12 devShare
lex@lexgb:~$

lex@lexgb:~$ sudo chgrp developer /devShare
lex@lexgb:~$ ls -la / | grep devShare
drwxrwsr-x   2 root developer  4096 Jun  7 09:12 devShare
lex@lexgb:~$

lex@lexgb:~$ su dev001
Password:
$ pwd
/home/lex
$ cd /devShare
$ pwd
/devShare
$ touch script001.py script002.py
$ ls -l
total 0
-rw-rw-r-- 1 dev001 developer 0 Jun  7 09:41 script001.py
-rw-rw-r-- 1 dev001 developer 0 Jun  7 09:41 script002.py
$ su dev002
Password:
$ pwd
/devShare
$ cat > script001.py
while
do
begin
end
$ ls -l
total 4
-rw-rw-r-- 1 dev001 developer 19 Jun  7 09:42 script001.py
-rw-rw-r-- 1 dev001 developer  0 Jun  7 09:41 script002.py
$ whoami
dev002
$ cat script001.py
while
do
begin
end
$

$ touch script003.py script004.py
$ ls -l
total 4
-rw-rw-r-- 1 dev001 developer 19 Jun  7 09:42 script001.py
-rw-rw-r-- 1 dev001 developer  0 Jun  7 09:41 script002.py
-rw-rw-r-- 1 dev002 developer  0 Jun  7 09:45 script003.py
-rw-rw-r-- 1 dev002 developer  0 Jun  7 09:45 script004.py
$

$ su dev001
Password:
$ cat > script004.py
main
def
#####
ok
$ whoami
dev001
$ ls -l
total 8
-rw-rw-r-- 1 dev001 developer 19 Jun  7 09:42 script001.py
-rw-rw-r-- 1 dev001 developer  0 Jun  7 09:41 script002.py
-rw-rw-r-- 1 dev002 developer  0 Jun  7 09:45 script003.py
-rw-rw-r-- 1 dev002 developer 18 Jun  7 09:47 script004.py
$
