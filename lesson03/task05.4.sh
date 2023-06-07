# Создать директорию, в которой есть несколько файлов. 
# Сделать так, чтобы открыть файлы можно было, только зная имя файла, 
# а через ls список файлов посмотреть было нельзя.

lex@lexgb:~$ sudo usermod -aG developer lex
lex@lexgb:~$ tail /etc/group
testgroup:x:1003:testuser2
testgroup2:x:1001:
testuser3:x:1004:
user002:x:1006:
group001:x:1005:
group002:x:1007:user002,testuser2,testuser3
kolobok:x:1008:
developer:x:1009:dev001,dev002,lex
dev001:x:1010:
dev002:x:1011:
lex@lexgb:~$

lex@lexgb:~$ cd /devShare/
lex@lexgb:/devShare$ ls -l
total 12
-rw-rw-r-- 1 dev001 developer   19 Jun  7 09:42 script001.py
-rw-rw-r-- 1 dev001 developer    0 Jun  7 09:41 script002.py
-rw-rw-r-- 1 dev002 developer    0 Jun  7 09:45 script003.py
-rw-rw-r-- 1 dev002 developer   18 Jun  7 09:47 script004.py
drwxrwsr-t 2 dev001 developer 4096 Jun  7 11:12 temp
lex@lexgb:/devShare$

lex@lexgb:/devShare$ sudo mkdir hiddenFolder
lex@lexgb:/devShare$ ls -l
total 16
drwxr-sr-x 2 root   developer 4096 Jun  7 11:21 hiddenFolder
-rw-rw-r-- 1 dev001 developer   19 Jun  7 09:42 script001.py
-rw-rw-r-- 1 dev001 developer    0 Jun  7 09:41 script002.py
-rw-rw-r-- 1 dev002 developer    0 Jun  7 09:45 script003.py
-rw-rw-r-- 1 dev002 developer   18 Jun  7 09:47 script004.py
drwxrwsr-t 2 dev001 developer 4096 Jun  7 11:12 temp
lex@lexgb:/devShare$ sudo chown lex hiddenFolder/
lex@lexgb:/devShare$ ls -l
total 16
drwxr-sr-x 2 lex    developer 4096 Jun  7 11:21 hiddenFolder
-rw-rw-r-- 1 dev001 developer   19 Jun  7 09:42 script001.py
-rw-rw-r-- 1 dev001 developer    0 Jun  7 09:41 script002.py
-rw-rw-r-- 1 dev002 developer    0 Jun  7 09:45 script003.py
-rw-rw-r-- 1 dev002 developer   18 Jun  7 09:47 script004.py
drwxrwsr-t 2 dev001 developer 4096 Jun  7 11:12 temp
lex@lexgb:/devShare$

lex@lexgb:/devShare$ chmod 331 hiddenFolder/
lex@lexgb:/devShare$ ls -l
total 16
d-wx-wx--x 2 lex    developer 4096 Jun  7 11:21 hiddenFolder
-rw-rw-r-- 1 dev001 developer   19 Jun  7 09:42 script001.py
-rw-rw-r-- 1 dev001 developer    0 Jun  7 09:41 script002.py
-rw-rw-r-- 1 dev002 developer    0 Jun  7 09:45 script003.py
-rw-rw-r-- 1 dev002 developer   18 Jun  7 09:47 script004.py
drwxrwsr-t 2 dev001 developer 4096 Jun  7 11:12 temp
lex@lexgb:/devShare$

lex@lexgb:/devShare$ touch hiddenFolder/script010.py hiddenFolder/script011.py
lex@lexgb:/devShare$ cat > hiddenFolder/script010.py
12345
12345
12345
lex@lexgb:/devShare$ ls -l hiddenFolder/
ls: cannot open directory 'hiddenFolder/': Permission denied
lex@lexgb:/devShare$ cat hiddenFolder/script010.py
12345
12345
12345
lex@lexgb:/devShare$ sudo ls -l hiddenFolder/
total 4
-rw-rw-r-- 1 lex lex 18 Jun  7 11:25 script010.py
-rw-rw-r-- 1 lex lex  0 Jun  7 11:25 script011.py
lex@lexgb:/devShare$

lex@lexgb:/devShare$ sudo chgrp developer hiddenFolder/script011.py
lex@lexgb:/devShare$ sudo ls -l hiddenFolder/
total 4
-rw-rw-r-- 1 lex lex       18 Jun  7 11:25 script010.py
-rw-rw-r-- 1 lex developer  0 Jun  7 11:25 script011.py
lex@lexgb:/devShare$

lex@lexgb:/devShare$ su dev001
Password:
$ ls -l hiddenFolder/
ls: cannot open directory 'hiddenFolder/': Permission denied
$ cat > hiddenFolder/script011.py
bla-bla-bla
$
$ su lex
Password:
lex@lexgb:/devShare$ sudo ls -l hiddenFolder/
total 8
-rw-rw-r-- 1 lex lex       18 Jun  7 11:25 script010.py
-rw-rw-r-- 1 lex developer 12 Jun  7 11:33 script011.py
lex@lexgb:/devShare$
