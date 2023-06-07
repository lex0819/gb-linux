# Используя дополнительные материалы, выдать одному из созданных пользователей право на выполнение ряда команд, 
# требующих прав суперпользователя (команды выбираем на своё усмотрение).
# например только (!) удаление пользователей

lex@lexgb:~$ sudo cat /etc/group | grep sudo
sudo:x:27:lex
lex@lexgb:~$

lex@lexgb:~$ sudo tail /etc/passwd
lex:x:1000:1000:lex:/home/lex:/bin/bash
syslog:x:107:113::/home/syslog:/usr/sbin/nologin
uuidd:x:108:114::/run/uuidd:/usr/sbin/nologin
tcpdump:x:109:115::/nonexistent:/usr/sbin/nologin
lxd:x:999:100::/var/snap/lxd/common/lxd:/bin/false
testuser2:x:1002:1005:Kolobok,3,12121212,23232323:/home/testuser2:/bin/bash
user002:x:1001:1005:user002,002,34343434,23232323:/home/user002:/bin/bash
kolobok:x:1004:1008:Kolobok,1,23,34:/home/kolobok:/bin/bash
dev001:x:1005:1010::/home/dev001:/bin/sh
dev002:x:1006:1011::/home/dev002:/bin/sh
lex@lexgb:~$

lex@lexgb:~$ su user002
Password:
user002@lexgb:/home/lex$ cd ~
user002@lexgb:~$ deluser testuser2
/usr/sbin/deluser: Only root may remove a user or group from the system.
user002@lexgb:~$ sudo deluser testuser2
[sudo] password for user002:
user002 is not in the sudoers file.  This incident will be reported.
user002@lexgb:~$

user002@lexgb:~$ su lex
Password:
lex@lexgb:/home/user002$ cd ~
lex@lexgb:~$ sudo visudo

# See sudoers(5) for more information on "@include" directives:
@includedir /etc/sudoers.d
user002 ALL=/usr/sbin/deluser

lex@lexgb:~$ su user002
Password:
user002@lexgb:/home/lex$ cd ~
user002@lexgb:~$ sudo deluser testuser2
[sudo] password for user002:
Removing user `testuser2' ...
Warning: group `group001' has no more members.
userdel: group testuser2 not removed because it is not the primary group of user testuser2.
Done.
user002@lexgb:~$ sudo tail /etc/passwd
Sorry, user user002 is not allowed to execute '/usr/bin/tail /etc/passwd' as root on lexgb.
user002@lexgb:~$

user002@lexgb:~$ su lex
Password:
lex@lexgb:/home/user002$ cd ~
lex@lexgb:~$ sudo cat /etc/passwd | grep testuser2
lex@lexgb:~$ sudo tail /etc/passwd
sshd:x:106:65534::/run/sshd:/usr/sbin/nologin
lex:x:1000:1000:lex:/home/lex:/bin/bash
syslog:x:107:113::/home/syslog:/usr/sbin/nologin
uuidd:x:108:114::/run/uuidd:/usr/sbin/nologin
tcpdump:x:109:115::/nonexistent:/usr/sbin/nologin
lxd:x:999:100::/var/snap/lxd/common/lxd:/bin/false
user002:x:1001:1005:user002,002,34343434,23232323:/home/user002:/bin/bash
kolobok:x:1004:1008:Kolobok,1,23,34:/home/kolobok:/bin/bash
dev001:x:1005:1010::/home/dev001:/bin/sh
dev002:x:1006:1011::/home/dev002:/bin/sh
lex@lexgb:~$
