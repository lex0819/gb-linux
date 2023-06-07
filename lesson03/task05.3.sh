# Создать в директории для совместной работы поддиректорию для обмена файлами, 
# но чтобы удалять файлы могли только их создатели.

$ pwd
/devShare
$ whoami
dev001
$ mkdir temp
$ ls -l
total 12
-rw-rw-r-- 1 dev001 developer   19 Jun  7 09:42 script001.py
-rw-rw-r-- 1 dev001 developer    0 Jun  7 09:41 script002.py
-rw-rw-r-- 1 dev002 developer    0 Jun  7 09:45 script003.py
-rw-rw-r-- 1 dev002 developer   18 Jun  7 09:47 script004.py
drwxrwsr-x 2 dev001 developer 4096 Jun  7 10:55 temp
$ chmod o+t temp/
$ ls -l
total 12
-rw-rw-r-- 1 dev001 developer   19 Jun  7 09:42 script001.py
-rw-rw-r-- 1 dev001 developer    0 Jun  7 09:41 script002.py
-rw-rw-r-- 1 dev002 developer    0 Jun  7 09:45 script003.py
-rw-rw-r-- 1 dev002 developer   18 Jun  7 09:47 script004.py
drwxrwsr-t 2 dev001 developer 4096 Jun  7 10:55 temp
$

$ cp script*.py temp/
$ ls -lR
.:
total 12
-rw-rw-r-- 1 dev001 developer   19 Jun  7 09:42 script001.py
-rw-rw-r-- 1 dev001 developer    0 Jun  7 09:41 script002.py
-rw-rw-r-- 1 dev002 developer    0 Jun  7 09:45 script003.py
-rw-rw-r-- 1 dev002 developer   18 Jun  7 09:47 script004.py
drwxrwsr-t 2 dev001 developer 4096 Jun  7 11:02 temp

./temp:
total 8
-rw-rw-r-- 1 dev001 developer 19 Jun  7 11:02 script001.py
-rw-rw-r-- 1 dev001 developer  0 Jun  7 11:02 script002.py
-rw-rw-r-- 1 dev001 developer  0 Jun  7 11:02 script003.py
-rw-rw-r-- 1 dev001 developer 18 Jun  7 11:02 script004.py
$

$ su dev002
Password:
$ whoami
dev002
$ cat temp/script001.py
while
do
begin
end
$ rm temp/script001.py
rm: cannot remove 'temp/script001.py': Operation not permitted
$

$ cp script002.py temp/script005.py
$ ls -l temp/
total 4
-rw-rw-r-- 1 dev001 developer  0 Jun  7 11:07 script001.py
-rw-rw-r-- 1 dev001 developer  0 Jun  7 11:02 script002.py
-rw-rw-r-- 1 dev001 developer  0 Jun  7 11:02 script003.py
-rw-rw-r-- 1 dev001 developer 18 Jun  7 11:02 script004.py
-rw-rw-r-- 1 dev002 developer  0 Jun  7 11:11 script005.py
$ rm temp/script005.py
$ ls -l temp/
total 4
-rw-rw-r-- 1 dev001 developer  0 Jun  7 11:07 script001.py
-rw-rw-r-- 1 dev001 developer  0 Jun  7 11:02 script002.py
-rw-rw-r-- 1 dev001 developer  0 Jun  7 11:02 script003.py
-rw-rw-r-- 1 dev001 developer 18 Jun  7 11:02 script004.py
$