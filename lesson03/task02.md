# Управление пользователями

\```bash
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
\```
