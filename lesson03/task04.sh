# Создать пользователя с правами суперпользователя.
# Сделать так, чтобы sudo не требовал пароль для выполнения команд.

lex@lexgb:~$ sudo adduser kolobok
Adding user `kolobok' ...
Adding new group `kolobok' (1008) ...
Adding new user `kolobok' (1004) with group `kolobok' ...
Creating home directory `/home/kolobok' ...
Copying files from `/etc/skel' ...
New password:
Retype new password:
passwd: password updated successfully
Changing the user information for kolobok
Enter the new value, or press ENTER for the default
	Full Name []: Kolobok
	Room Number []: 1
	Work Phone []: 23
	Home Phone []: 34
	Other []:
Is the information correct? [Y/n] y
lex@lexgb:~$ sudo id kolobok
uid=1004(kolobok) gid=1008(kolobok) groups=1008(kolobok)
lex@lexgb:~$

lex@lexgb:~$ sudo usermod -aG sudo kolobok
lex@lexgb:~$ id kolobok
uid=1004(kolobok) gid=1008(kolobok) groups=1008(kolobok),27(sudo)
lex@lexgb:~$

lex@lexgb:~$ sudo visudo

# Allow members of group sudo to execute any command
%sudo   ALL=(ALL:ALL) NOPASSWD:ALL

lex@lexgb:~$ su kolobok
Password:
To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.

kolobok@lexgb:/home/lex$ whoami
kolobok
