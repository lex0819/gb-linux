lex@gblex:~$ wget --help
GNU Wget 1.21.2, a non-interactive network retriever.
Usage: wget [OPTION]... [URL]...

lex@gblex:~$ cd ~/Downloads/

lex@gblex:~/Downloads$ ping vivaldi.com
PING vivaldi.com (188.114.98.234) 56(84) bytes of data.
64 bytes from 188.114.98.234 (188.114.98.234): icmp_seq=1 ttl=56 time=5.88 ms
64 bytes from 188.114.98.234 (188.114.98.234): icmp_seq=2 ttl=56 time=6.76 ms
64 bytes from 188.114.98.234 (188.114.98.234): icmp_seq=3 ttl=56 time=6.49 ms
64 bytes from 188.114.98.234 (188.114.98.234): icmp_seq=4 ttl=56 time=6.56 ms
64 bytes from 188.114.98.234 (188.114.98.234): icmp_seq=5 ttl=56 time=7.94 ms
64 bytes from 188.114.98.234 (188.114.98.234): icmp_seq=6 ttl=56 time=6.04 ms
^C
--- vivaldi.com ping statistics ---
6 packets transmitted, 6 received, 0% packet loss, time 5021ms
rtt min/avg/max/mdev = 5.876/6.611/7.938/0.666 ms
lex@gblex:~/Downloads$

lex@gblex:~/Downloads$ wget https://downloads.vivaldi.com/stable/vivaldi-stable_6.1.3035.75-1_amd64.deb
--2023-06-12 12:00:25--  https://downloads.vivaldi.com/stable/vivaldi-stable_6.1.3035.75-1_amd64.deb
Resolving downloads.vivaldi.com (downloads.vivaldi.com)... 151.101.2.137, 151.101.66.137, 151.101.130.137, ...
Connecting to downloads.vivaldi.com (downloads.vivaldi.com)|151.101.2.137|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 97880224 (93M) [application/octet-stream]
Saving to: ‘vivaldi-stable_6.1.3035.75-1_amd64.deb’

vivaldi-stable_6.1.30 100%[========================>]  93,35M  2,14MB/s    in 35s

2023-06-12 12:01:00 (2,69 MB/s) - ‘vivaldi-stable_6.1.3035.75-1_amd64.deb’ saved [97880224/97880224]

lex@gblex:~/Downloads$


lex@gblex:~/Downloads$ sudo dpkg -i vivaldi-stable_6.1.3035.75-1_amd64.deb
[sudo] password for lex:
Selecting previously unselected package vivaldi-stable.
(Reading database ... 184934 files and directories currently installed.)
Preparing to unpack vivaldi-stable_6.1.3035.75-1_amd64.deb ...
Unpacking vivaldi-stable (6.1.3035.75-1) ...
Setting up vivaldi-stable (6.1.3035.75-1) ...
update-alternatives: using /usr/bin/vivaldi-stable to provide /usr/bin/x-www-browser (x-www-browser) in auto mode
update-alternatives: using /usr/bin/vivaldi-stable to provide /usr/bin/gnome-www-browser (gnome-www-browser) in auto mode
update-alternatives: using /usr/bin/vivaldi-stable to provide /usr/bin/vivaldi (vivaldi) in auto mode
Processing triggers for mailcap (3.70+nmu1ubuntu1) ...
Processing triggers for gnome-menus (3.36.0-1ubuntu3) ...
Processing triggers for desktop-file-utils (0.26-1ubuntu3) ...
lex@gblex:~/Downloads$


lex@gblex:~/Downloads$ dpkg --get-selections | grep vivaldi
vivaldi-stable                                  install
lex@gblex:~/Downloads$
lex@gblex:~/Downloads$
lex@gblex:~/Downloads$ apt list --installed | grep vivaldi

WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

vivaldi-stable/now 6.1.3035.75-1 amd64 [installed,local]
lex@gblex:~/Downloads$


lex@gblex:~/Downloads$ sudo apt remove vivaldi
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
E: Unable to locate package vivaldi
lex@gblex:~/Downloads$


lex@gblex:~$ sudo apt purge vivaldi
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
E: Unable to locate package vivaldi
lex@gblex:~$

lex@gblex:~$ sudo find / -type d -name *vivaldi* 2>/dev/null
/usr/share/doc/vivaldi-stable
/opt/vivaldi
/opt/vivaldi/resources/vivaldi
/var/opt/vivaldi
