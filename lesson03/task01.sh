# Создать два произвольных файла. Первому присвоить права на чтение и запись для владельца и группы, только на чтение — для всех.
# Второму присвоить права на чтение и запись только для владельца. Сделать это в численном и символьном виде.
# Назначить новых владельца и группу для директории целиком.

lex@lexgb:~$ pwd
/home/lex
lex@lexgb:~$ mkdir folder001
lex@lexgb:~$ ls -l
total 16
drwxrwxr-x 2 lex lex 4096 Jun  7 08:06 folder001
drwxrwxr-x 2 lex lex 4096 Jun  7 05:05 hide
drwxrwxr-x 2 lex lex 4096 May 30 13:44 test02
drwxrwxr-x 2 lex lex 4096 May 30 07:12 test03
lex@lexgb:~$

lex@lexgb:~$ cd folder001/
lex@lexgb:~/folder001$ touch file001 file002
lex@lexgb:~/folder001$ ls -l
total 0
-rw-rw-r-- 1 lex lex 0 Jun  7 08:08 file001
-rw-rw-r-- 1 lex lex 0 Jun  7 08:08 file002
lex@lexgb:~/folder001$

lex@lexgb:~/folder001$ chmod 664 file001
lex@lexgb:~/folder001$ ls -l
total 0
-rw-rw-r-- 1 lex lex 0 Jun  7 08:08 file001
-rw-rw-r-- 1 lex lex 0 Jun  7 08:08 file002
lex@lexgb:~/folder001$

lex@lexgb:~/folder001$ chmod g-w file002
lex@lexgb:~/folder001$ ls -l
total 0
-rw-rw-r-- 1 lex lex 0 Jun  7 08:08 file001
-rw-r--r-- 1 lex lex 0 Jun  7 08:08 file002
lex@lexgb:~/folder001$

lex@lexgb:~/folder001$ cd ..
lex@lexgb:~$ ls -l
total 16
drwxrwxr-x 2 lex lex 4096 Jun  7 08:08 folder001
drwxrwxr-x 2 lex lex 4096 Jun  7 05:05 hide
drwxrwxr-x 2 lex lex 4096 May 30 13:44 test02
drwxrwxr-x 2 lex lex 4096 May 30 07:12 test03

lex@lexgb:~$ sudo chown user002 folder001
lex@lexgb:~$ ls -l
total 16
drwxrwxr-x 2 user002 lex 4096 Jun  7 08:08 folder001
drwxrwxr-x 2 lex     lex 4096 Jun  7 05:05 hide
drwxrwxr-x 2 lex     lex 4096 May 30 13:44 test02
drwxrwxr-x 2 lex     lex 4096 May 30 07:12 test03
lex@lexgb:~$

lex@lexgb:~$ sudo chgrp group001 folder001
lex@lexgb:~$ ls -l
total 16
drwxrwxr-x 2 user002 group001 4096 Jun  7 08:08 folder001
drwxrwxr-x 2 lex     lex      4096 Jun  7 05:05 hide
drwxrwxr-x 2 lex     lex      4096 May 30 13:44 test02
drwxrwxr-x 2 lex     lex      4096 May 30 07:12 test03
lex@lexgb:~$
