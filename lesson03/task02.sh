# Управление пользователями
# создать пользователя, используя утилиту useradd и adduser;
# удалить пользователя, используя утилиту userdel.

lex@lexgb:~$ pwd
/home/lex
lex@lexgb:~$ sudo useradd -s /bin/bash -m -d /home/user001 user001
[sudo] password for lex:
lex@lexgb:~$ sudo passwd user001
New password:
Retype new password:
passwd: password updated successfully
lex@lexgb:~$ sudo id user001
uid=1004(user001) gid=1005(user001) groups=1005(user001)
lex@lexgb:~$

lex@lexgb:~$ sudo adduser user002
Adding user `user002' ...
Adding new group `user002' (1006) ...
Adding new user `user002' (1001) with group `user002' ...
Creating home directory `/home/user002' ...
Copying files from `/etc/skel' ...
New password:
Retype new password:
passwd: password updated successfully
Changing the user information for user002
Enter the new value, or press ENTER for the default
	Full Name []: user002
	Room Number []: 002
	Work Phone []: 34343434
	Home Phone []: 23232323
	Other []:
Is the information correct? [Y/n] y
lex@lexgb:~$ sudo id user002
uid=1001(user002) gid=1006(user002) groups=1006(user002)
lex@lexgb:~$

lex@lexgb:~$ tail /etc/passwd
sshd:x:106:65534::/run/sshd:/usr/sbin/nologin
lex:x:1000:1000:lex:/home/lex:/bin/bash
syslog:x:107:113::/home/syslog:/usr/sbin/nologin
uuidd:x:108:114::/run/uuidd:/usr/sbin/nologin
tcpdump:x:109:115::/nonexistent:/usr/sbin/nologin
lxd:x:999:100::/var/snap/lxd/common/lxd:/bin/false
testuser2:x:1002:1001:Kolobok,3,12121212,23232323:/home/testuser2:/bin/bash
testuser3:x:1003:1003::/home/testuser3:/bin/bash
user001:x:1004:1005::/home/user001:/bin/bash
user002:x:1001:1006:user002,002,34343434,23232323:/home/user002:/bin/bash
lex@lexgb:~$

lex@lexgb:~$ sudo userdel -r user001
userdel: user001 mail spool (/var/mail/user001) not found
lex@lexgb:~$ sudo id user001
id: ‘user001’: no such user
lex@lexgb:~$ sudo ls -l /home
total 16
drwxr-x--- 9 lex       lex        4096 Jun  7 05:04 lex
drwxr-x--- 2 testuser2 testgroup2 4096 Jun  6 13:38 testuser2
drwxr-x--- 2 testuser3 testgroup  4096 Jun  6 14:05 testuser3
drwxr-x--- 2 user002   user002    4096 Jun  7 07:11 user002
lex@lexgb:~$
