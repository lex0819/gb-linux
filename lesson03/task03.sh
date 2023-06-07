# Управление группами:
# создать группу с использованием утилит groupadd и addgroup;
# попрактиковаться в смене групп у пользователей;
# добавить пользователя в группу, не меняя основной;


lex@lexgb:~$ sudo addgroup group001
Adding group `group001' (GID 1005) ...
Done.
lex@lexgb:~$ tail /etc/group
crontab:x:112:
syslog:x:113:
uuidd:x:114:
tcpdump:x:115:
testuser2:x:1002:
testgroup:x:1003:testuser2
testgroup2:x:1001:
testuser3:x:1004:
user002:x:1006:
group001:x:1005:
lex@lexgb:~$

lex@lexgb:~$ sudo groupadd group002
lex@lexgb:~$ tail /etc/group
syslog:x:113:
uuidd:x:114:
tcpdump:x:115:
testuser2:x:1002:
testgroup:x:1003:testuser2
testgroup2:x:1001:
testuser3:x:1004:
user002:x:1006:
group001:x:1005:
group002:x:1007:
lex@lexgb:~$

lex@lexgb:~$ sudo id user002
uid=1001(user002) gid=1006(user002) groups=1006(user002)
lex@lexgb:~$ sudo usermod -g group001 user002
[sudo] password for lex:
lex@lexgb:~$ sudo id user002
uid=1001(user002) gid=1005(group001) groups=1005(group001)
lex@lexgb:~$

lex@lexgb:~$ sudo id testuser2
uid=1002(testuser2) gid=1001(testgroup2) groups=1001(testgroup2),1003(testgroup)
lex@lexgb:~$ sudo usermod -g group001 testuser2
lex@lexgb:~$ sudo id testuser2
uid=1002(testuser2) gid=1005(group001) groups=1005(group001),1003(testgroup)
lex@lexgb:~$

lex@lexgb:~$ sudo id testuser3
uid=1003(testuser3) gid=1003(testgroup) groups=1003(testgroup)
lex@lexgb:~$ sudo usermod -g group001 testuser3
lex@lexgb:~$ sudo id testuser3
uid=1003(testuser3) gid=1005(group001) groups=1005(group001)
lex@lexgb:~$

lex@lexgb:~$ sudo usermod -aG group002 user002
lex@lexgb:~$ sudo id user002
uid=1001(user002) gid=1005(group001) groups=1005(group001),1007(group002)
lex@lexgb:~$

lex@lexgb:~$ sudo usermod -aG group002 testuser2
lex@lexgb:~$ sudo id testuser2
uid=1002(testuser2) gid=1005(group001) groups=1005(group001),1003(testgroup),1007(group002)
lex@lexgb:~$

lex@lexgb:~$ sudo usermod -aG group002 testuser3
lex@lexgb:~$ sudo id testuser3
uid=1003(testuser3) gid=1005(group001) groups=1005(group001),1007(group002)
lex@lexgb:~$
