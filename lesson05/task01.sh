lex@gblex:~$ sudo apt-get update
Hit:1 http://ru.archive.ubuntu.com/ubuntu jammy InRelease
Hit:2 http://ru.archive.ubuntu.com/ubuntu jammy-updates InRelease
Hit:3 http://ru.archive.ubuntu.com/ubuntu jammy-backports InRelease
Hit:4 http://security.ubuntu.com/ubuntu jammy-security InRelease
Reading package lists... Done
lex@gblex:~$


lex@gblex:~$ sudo apt install curl software-properties-common ca-certificates apt-transport-https -y
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
ca-certificates is already the newest version (20230311ubuntu0.22.04.1).
curl is already the newest version (7.81.0-1ubuntu1.10).
software-properties-common is already the newest version (0.99.22.7).
software-properties-common set to manually installed.
The following NEW packages will be installed:
  apt-transport-https
0 upgraded, 1 newly installed, 0 to remove and 4 not upgraded.
Need to get 1 510 B of archives.
After this operation, 169 kB of additional disk space will be used.
Get:1 http://ru.archive.ubuntu.com/ubuntu jammy-updates/universe amd64 apt-transport-https all 2.4.9 [1 510 B]
Fetched 1 510 B in 0s (17,3 kB/s)
Selecting previously unselected package apt-transport-https.
(Reading database ... 183685 files and directories currently installed.)
Preparing to unpack .../apt-transport-https_2.4.9_all.deb ...
Unpacking apt-transport-https (2.4.9) ...
Setting up apt-transport-https (2.4.9) ...
lex@gblex:~$


lex@gblex:~$ curl -f -s -S -L https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
Warning: apt-key is deprecated. Manage keyring files in trusted.gpg.d instead (see apt-key(8)).
OK
lex@gblex:~$


lex@gblex:~$ sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu jammy stable"
Repository: 'deb [arch=amd64] https://download.docker.com/linux/ubuntu jammy stable'
Description:
Archive for codename: jammy components: stable
More info: https://download.docker.com/linux/ubuntu
Adding repository.
Press [ENTER] to continue or Ctrl-c to cancel.
Found existing deb entry in /etc/apt/sources.list.d/archive_uri-https_download_docker_com_linux_ubuntu-jammy.list
Adding deb entry to /etc/apt/sources.list.d/archive_uri-https_download_docker_com_linux_ubuntu-jammy.list
Found existing deb-src entry in /etc/apt/sources.list.d/archive_uri-https_download_docker_com_linux_ubuntu-jammy.list
Adding disabled deb-src entry to /etc/apt/sources.list.d/archive_uri-https_download_docker_com_linux_ubuntu-jammy.list
Hit:1 http://ru.archive.ubuntu.com/ubuntu jammy InRelease
Hit:2 http://ru.archive.ubuntu.com/ubuntu jammy-updates InRelease
Hit:3 http://ru.archive.ubuntu.com/ubuntu jammy-backports InRelease
Hit:4 http://security.ubuntu.com/ubuntu jammy-security InRelease
Get:5 https://download.docker.com/linux/ubuntu jammy InRelease [48,9 kB]
Get:6 https://download.docker.com/linux/ubuntu jammy/stable amd64 Packages [19,2 kB]
Fetched 68,1 kB in 1s (67,5 kB/s)
Reading package lists... Done
W: https://download.docker.com/linux/ubuntu/dists/jammy/InRelease: Key is stored in legacy trusted.gpg keyring (/etc/apt/trusted.gpg), see the DEPRECATION section in apt-key(8) for details.
lex@gblex:~$



lex@gblex:~$ sudo apt update
Hit:1 http://ru.archive.ubuntu.com/ubuntu jammy InRelease
Hit:2 http://ru.archive.ubuntu.com/ubuntu jammy-updates InRelease
Hit:3 http://ru.archive.ubuntu.com/ubuntu jammy-backports InRelease
Hit:4 https://download.docker.com/linux/ubuntu jammy InRelease
Hit:5 http://security.ubuntu.com/ubuntu jammy-security InRelease
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
4 packages can be upgraded. Run 'apt list --upgradable' to see them.
W: https://download.docker.com/linux/ubuntu/dists/jammy/InRelease: Key is stored in legacy trusted.gpg keyring (/etc/apt/trusted.gpg), see the DEPRECATION section in apt-key(8) for details.
lex@gblex:~$



lex@gblex:~$ sudo apt install docker-ce -y
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following additional packages will be installed:
  containerd.io docker-buildx-plugin docker-ce-cli docker-ce-rootless-extras
  docker-compose-plugin git git-man liberror-perl libslirp0 pigz slirp4netns
Suggested packages:
  aufs-tools cgroupfs-mount | cgroup-lite git-daemon-run | git-daemon-sysvinit
  git-doc git-email git-gui gitk gitweb git-cvs git-mediawiki git-svn
The following NEW packages will be installed:
  containerd.io docker-buildx-plugin docker-ce docker-ce-cli
  docker-ce-rootless-extras docker-compose-plugin git git-man liberror-perl libslirp0
  pigz slirp4netns
0 upgraded, 12 newly installed, 0 to remove and 4 not upgraded.
Need to get 115 MB of archives.
After this operation, 422 MB of additional disk space will be used.
Get:1 http://ru.archive.ubuntu.com/ubuntu jammy/universe amd64 pigz amd64 2.6-1 [63,6 kSelecting previously unselected package slirp4netns.
Preparing to unpack .../11-slirp4netns_1.0.1-2_amd64.deb ...
Unpacking slirp4netns (1.0.1-2) ...
Setting up liberror-perl (0.17029-1) ...
Setting up docker-buildx-plugin (0.10.5-1~ubuntu.22.04~jammy) ...
Setting up containerd.io (1.6.21-1) ...
Created symlink /etc/systemd/system/multi-user.target.wants/containerd.service → /lib/systemd/system/containerd.service.
Setting up docker-compose-plugin (2.18.1-1~ubuntu.22.04~jammy) ...
Setting up docker-ce-cli (5:24.0.2-1~ubuntu.22.04~jammy) ...
Setting up libslirp0:amd64 (4.6.1-1build1) ...
Setting up pigz (2.6-1) ...
Setting up git-man (1:2.34.1-1ubuntu1.9) ...
Setting up docker-ce-rootless-extras (5:24.0.2-1~ubuntu.22.04~jammy) ...
Setting up slirp4netns (1.0.1-2) ...
Setting up docker-ce (5:24.0.2-1~ubuntu.22.04~jammy) ...
Created symlink /etc/systemd/system/multi-user.target.wants/docker.service → /lib/systemd/system/docker.service.
Created symlink /etc/systemd/system/sockets.target.wants/docker.socket → /lib/systemd/system/docker.socket.
Setting up git (1:2.34.1-1ubuntu1.9) ...
Processing triggers for man-db (2.10.2-1) ...
Processing triggers for libc-bin (2.35-0ubuntu3.1) ...
lex@gblex:~$


lex@gblex:~$ sudo systemctl status docker
● docker.service - Docker Application Container Engine
     Loaded: loaded (/lib/systemd/system/docker.service; enabled; vendor preset: enabl>
     Active: active (running) since Mon 2023-06-12 10:32:31 MSK; 40s ago
TriggeredBy: ● docker.socket
       Docs: https://docs.docker.com
   Main PID: 5175 (dockerd)
      Tasks: 10
     Memory: 28.3M
        CPU: 1.100s
     CGroup: /system.slice/docker.service
             └─5175 /usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.>

июн 12 10:32:29 gblex systemd[1]: Starting Docker Application Container Engine...
июн 12 10:32:29 gblex dockerd[5175]: time="2023-06-12T10:32:29.525142632+03:00" level=>
июн 12 10:32:29 gblex dockerd[5175]: time="2023-06-12T10:32:29.528092692+03:00" level=>
июн 12 10:32:30 gblex dockerd[5175]: time="2023-06-12T10:32:30.028771123+03:00" level=>
июн 12 10:32:30 gblex dockerd[5175]: time="2023-06-12T10:32:30.938299900+03:00" level=>
июн 12 10:32:31 gblex dockerd[5175]: time="2023-06-12T10:32:31.087831260+03:00" level=>
июн 12 10:32:31 gblex dockerd[5175]: time="2023-06-12T10:32:31.088020046+03:00" level=>
июн 12 10:32:31 gblex dockerd[5175]: time="2023-06-12T10:32:31.171143936+03:00" level=>
июн 12 10:32:31 gblex systemd[1]: Started Docker Application Container Engine.
lex@gblex:~$
