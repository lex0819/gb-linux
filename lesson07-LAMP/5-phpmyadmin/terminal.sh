lex@gblex:~$ systemctl status apache2
● apache2.service - The Apache HTTP Server
     Loaded: loaded (/lib/systemd/system/apache2.service; enabled; vendor preset: enabled)
     Active: active (running) since Wed 2023-06-21 08:15:58 UTC; 1h 10min ago
       Docs: https://httpd.apache.org/docs/2.4/
    Process: 776 ExecStart=/usr/sbin/apachectl start (code=exited, status=0/SUCCESS)
   Main PID: 864 (apache2)
      Tasks: 6 (limit: 9345)
     Memory: 16.7M
        CPU: 355ms
     CGroup: /system.slice/apache2.service
             ├─864 /usr/sbin/apache2 -k start
             ├─881 /usr/sbin/apache2 -k start
             ├─882 /usr/sbin/apache2 -k start
             ├─883 /usr/sbin/apache2 -k start
             ├─884 /usr/sbin/apache2 -k start
             └─885 /usr/sbin/apache2 -k start

Jun 21 08:15:58 gblex systemd[1]: Starting The Apache HTTP Server...
Jun 21 08:15:58 gblex apachectl[806]: AH00558: apache2: Could not reliably determine the server's fu
lly qualified domain name, using 127.0.1.1. Set the 'ServerName' directive globally to suppress this
 message
Jun 21 08:15:58 gblex systemd[1]: Started The Apache HTTP Server.
lex@gblex:~$
lex@gblex:~$
lex@gblex:~$
lex@gblex:~$ systemctl stop apache2
==== AUTHENTICATING FOR org.freedesktop.systemd1.manage-units ===
Authentication is required to stop 'apache2.service'.
Authenticating as: lex
Password:
==== AUTHENTICATION COMPLETE ===
lex@gblex:~$
lex@gblex:~$
lex@gblex:~$ systemctl status apache2
○ apache2.service - The Apache HTTP Server
     Loaded: loaded (/lib/systemd/system/apache2.service; enabled; vendor preset: enabled)
     Active: inactive (dead) since Wed 2023-06-21 09:27:41 UTC; 7s ago
       Docs: https://httpd.apache.org/docs/2.4/
    Process: 776 ExecStart=/usr/sbin/apachectl start (code=exited, status=0/SUCCESS)
    Process: 1353 ExecStop=/usr/sbin/apachectl graceful-stop (code=exited, status=0/SUCCESS)
   Main PID: 864 (code=exited, status=0/SUCCESS)
        CPU: 407ms

Jun 21 08:15:58 gblex systemd[1]: Starting The Apache HTTP Server...
Jun 21 08:15:58 gblex apachectl[806]: AH00558: apache2: Could not reliably determine the server's fu
lly qualified domain name, using 127.0.1.1. Set the 'ServerName' directive globally to suppress this
 message
Jun 21 08:15:58 gblex systemd[1]: Started The Apache HTTP Server.
Jun 21 09:27:41 gblex systemd[1]: Stopping The Apache HTTP Server...
Jun 21 09:27:41 gblex apachectl[1355]: AH00558: apache2: Could not reliably determine the server's f
ully qualified domain name, using 127.0.1.1. Set the 'ServerName' directive globally to suppress thi
s message
Jun 21 09:27:41 gblex systemd[1]: apache2.service: Deactivated successfully.
Jun 21 09:27:41 gblex systemd[1]: Stopped The Apache HTTP Server.
lex@gblex:~$
lex@gblex:~$
lex@gblex:~$
lex@gblex:~$ systemctl status nginx
● nginx.service - A high performance web server and a reverse proxy server
     Loaded: loaded (/lib/systemd/system/nginx.service; enabled; vendor preset: enabled)
     Active: active (running) since Wed 2023-06-21 08:15:58 UTC; 1h 12min ago
       Docs: man:nginx(8)
    Process: 791 ExecStartPre=/usr/sbin/nginx -t -q -g daemon on; master_process on; (code=exited, s
tatus=0/SUCCESS)
    Process: 860 ExecStart=/usr/sbin/nginx -g daemon on; master_process on; (code=exited, status=0/S
UCCESS)
   Main PID: 871 (nginx)
      Tasks: 5 (limit: 9345)
     Memory: 10.3M
        CPU: 24ms
     CGroup: /system.slice/nginx.service
             ├─871 "nginx: master process /usr/sbin/nginx -g daemon on; master_process on;"
             ├─872 "nginx: worker process" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""
"" "" "" "" "" "" "" ""
             ├─873 "nginx: worker process" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""
"" "" "" "" "" "" "" ""
             ├─874 "nginx: worker process" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""
"" "" "" "" "" "" "" ""
             └─875 "nginx: worker process" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""
"" "" "" "" "" "" "" ""

Jun 21 08:15:58 gblex systemd[1]: Starting A high performance web server and a reverse proxy server.
..
Jun 21 08:15:58 gblex systemd[1]: Started A high performance web server and a reverse proxy server.
lex@gblex:~$
lex@gblex:~$
lex@gblex:~$
lex@gblex:~$
lex@gblex:~$ ss -tulpan
Netid State   Recv-Q  Send-Q                       Local Address:Port    Peer Address:Port  Process
udp   UNCONN  0       0                            127.0.0.53%lo:53           0.0.0.0:*
udp   UNCONN  0       0                     192.168.1.100%ens160:68           0.0.0.0:*
udp   UNCONN  0       0        [fe80::20c:29ff:fe91:9cd3]%ens160:546             [::]:*
tcp   LISTEN  0       70                               127.0.0.1:33060        0.0.0.0:*
tcp   LISTEN  0       151                              127.0.0.1:3306         0.0.0.0:*
tcp   LISTEN  0       511                                0.0.0.0:80           0.0.0.0:*
tcp   LISTEN  0       4096                         127.0.0.53%lo:53           0.0.0.0:*
tcp   LISTEN  0       128                                0.0.0.0:22           0.0.0.0:*
tcp   ESTAB   0       0                            192.168.1.100:80      192.168.1.93:50748
tcp   ESTAB   0       0                            192.168.1.100:22      192.168.1.93:49961
tcp   LISTEN  0       511                                   [::]:80              [::]:*
tcp   LISTEN  0       128                                   [::]:22              [::]:*
lex@gblex:~$
lex@gblex:~$
lex@gblex:~$
lex@gblex:~$
lex@gblex:~$ cd /etc/nginx/
lex@gblex:/etc/nginx$
lex@gblex:/etc/nginx$ ls -l
total 64
drwxr-xr-x 2 root root 4096 Nov 10  2022 conf.d
-rw-r--r-- 1 root root 1125 Jul 27  2022 fastcgi.conf
-rw-r--r-- 1 root root 1055 Jul 27  2022 fastcgi_params
-rw-r--r-- 1 root root 2837 Jul 27  2022 koi-utf
-rw-r--r-- 1 root root 2223 Jul 27  2022 koi-win
-rw-r--r-- 1 root root 3957 Aug  2  2022 mime.types
drwxr-xr-x 2 root root 4096 Nov 10  2022 modules-available
drwxr-xr-x 2 root root 4096 Jun 20 04:28 modules-enabled
-rw-r--r-- 1 root root 1449 Jun 20 06:59 nginx.conf
-rw-r--r-- 1 root root  180 Jul 27  2022 proxy_params
-rw-r--r-- 1 root root  636 Jul 27  2022 scgi_params
drwxr-xr-x 2 root root 4096 Jun 20 12:44 sites-available
drwxr-xr-x 2 root root 4096 Jun 20 04:28 sites-enabled
drwxr-xr-x 2 root root 4096 Jun 20 04:28 snippets
-rw-r--r-- 1 root root  664 Jul 27  2022 uwsgi_params
-rw-r--r-- 1 root root 3071 Jul 27  2022 win-utf
lex@gblex:/etc/nginx$ cd sites-available/
lex@gblex:/etc/nginx/sites-available$
lex@gblex:/etc/nginx/sites-available$ ls -l
total 4
-rw-r--r-- 1 root root 2963 Jun 20 12:44 default
lex@gblex:/etc/nginx/sites-available$
lex@gblex:/etc/nginx/sites-available$
lex@gblex:/etc/nginx/sites-available$ sudo nano default
[sudo] password for lex:
lex@gblex:/etc/nginx/sites-available$
lex@gblex:/etc/nginx/sites-available$
lex@gblex:/etc/nginx/sites-available$
lex@gblex:/etc/nginx/sites-available$ systemctl reload nginx
==== AUTHENTICATING FOR org.freedesktop.systemd1.manage-units ===
Authentication is required to reload 'nginx.service'.
Authenticating as: lex
Password:
==== AUTHENTICATION COMPLETE ===
lex@gblex:/etc/nginx/sites-available$
lex@gblex:/etc/nginx/sites-available$
lex@gblex:/etc/nginx/sites-available$
lex@gblex:/etc/nginx/sites-available$ echo 'nginx has ran on out IP 192.168.1.100/php-fpm.test '
nginx has ran on out IP 192.168.1.100/php-fpm.test
lex@gblex:/etc/nginx/sites-available$
lex@gblex:/etc/nginx/sites-available$
lex@gblex:/etc/nginx/sites-available$
lex@gblex:/etc/nginx/sites-available$ sudo mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.33-0ubuntu0.22.04.2 (Ubuntu)

Copyright (c) 2000, 2023, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> AlTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '123';
Query OK, 0 rows affected (0.01 sec)

mysql> exit
Bye
lex@gblex:/etc/nginx/sites-available$
lex@gblex:/etc/nginx/sites-available$
lex@gblex:/etc/nginx/sites-available$
lex@gblex:/etc/nginx/sites-available$
lex@gblex:/etc/nginx/sites-available$ sudo mysql -u root -p
Enter password:
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 9
Server version: 8.0.33-0ubuntu0.22.04.2 (Ubuntu)

Copyright (c) 2000, 2023, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql>
mysql> exit
Bye
lex@gblex:/etc/nginx/sites-available$
lex@gblex:/etc/nginx/sites-available$
lex@gblex:/etc/nginx/sites-available$
lex@gblex:/etc/nginx/sites-available$
lex@gblex:/etc/nginx/sites-available$ sudo apt install phpmyadmin
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following additional packages will be installed:
  dbconfig-common dbconfig-mysql icc-profiles-free javascript-common libjs-bootstrap4
  libjs-codemirror libjs-jquery libjs-jquery-mousewheel libjs-jquery-timepicker libjs-jquery-ui
  libjs-popper.js libjs-sizzle libjs-sphinxdoc libjs-underscore libonig5 libzip4 node-jquery
  php-bz2 php-curl php-gd php-google-recaptcha php-json php-mariadb-mysql-kbs php-mbstring
  php-mysql php-nikic-fast-route php-phpmyadmin-motranslator php-phpmyadmin-shapefile
  php-phpmyadmin-sql-parser php-phpseclib php-psr-cache php-psr-container php-psr-log
  php-symfony-cache php-symfony-cache-contracts php-symfony-config
  php-symfony-dependency-injection php-symfony-deprecation-contracts
  php-symfony-expression-language php-symfony-filesystem php-symfony-polyfill-php80
  php-symfony-polyfill-php81 php-symfony-service-contracts php-symfony-var-exporter php-tcpdf
  php-twig php-twig-i18n-extension php-xml php-zip php8.1-bz2 php8.1-curl php8.1-gd
  php8.1-mbstring php8.1-mysql php8.1-xml php8.1-zip
Suggested packages:
  libjs-requirejs libjs-jquery-ui-docs php-dbase php-libsodium php-mcrypt php-gmp php-symfony-yaml
  php-symfony-finder php-symfony-proxy-manager-bridge php-imagick php-twig-doc php-recode
  www-browser php-gd2 php-pragmarx-google2fa-qrcode php-samyoul-u2f-php-server
Recommended packages:
  php-mcrypt
The following NEW packages will be installed:
  dbconfig-common dbconfig-mysql icc-profiles-free javascript-common libjs-bootstrap4
  libjs-codemirror libjs-jquery libjs-jquery-mousewheel libjs-jquery-timepicker libjs-jquery-ui
  libjs-popper.js libjs-sizzle libjs-sphinxdoc libjs-underscore libonig5 libzip4 node-jquery
  php-bz2 php-curl php-gd php-google-recaptcha php-json php-mariadb-mysql-kbs php-mbstring
  php-mysql php-nikic-fast-route php-phpmyadmin-motranslator php-phpmyadmin-shapefile
  php-phpmyadmin-sql-parser php-phpseclib php-psr-cache php-psr-container php-psr-log
  php-symfony-cache php-symfony-cache-contracts php-symfony-config
  php-symfony-dependency-injection php-symfony-deprecation-contracts
  php-symfony-expression-language php-symfony-filesystem php-symfony-polyfill-php80
  php-symfony-polyfill-php81 php-symfony-service-contracts php-symfony-var-exporter php-tcpdf
  php-twig php-twig-i18n-extension php-xml php-zip php8.1-bz2 php8.1-curl php8.1-gd
  php8.1-mbstring php8.1-mysql php8.1-xml php8.1-zip phpmyadmin
0 upgraded, 57 newly installed, 0 to remove and 0 not upgraded.
Need to get 18.1 MB of archives.
After this operation, 84.0 MB of additional disk space will be used.
Do you want to continue? [Y/n] y
Get:1 http://ports.ubuntu.com/ubuntu-ports jammy/universe arm64 dbconfig-common all 2.0.21 [597 kB]
Get:2 http://ports.ubuntu.com/ubuntu-ports jammy/universe arm64 dbconfig-mysql all 2.0.21 [938 B]
Get:3 http://ports.ubuntu.com/ubuntu-ports jammy/main arm64 icc-profiles-free all 2.0.1+dfsg-1.1 [214 kB]
Get:4 http://ports.ubuntu.com/ubuntu-ports jammy/main arm64 javascript-common all 11+nmu1 [5936 B]
Get:5 http://ports.ubuntu.com/ubuntu-ports jammy/universe arm64 libjs-popper.js all 1.16.1+ds-5 [53.8 kB]
Get:6 http://ports.ubuntu.com/ubuntu-ports jammy/universe arm64 libjs-bootstrap4 all 4.6.0+dfsg1-4 [534 kB]
Get:7 http://ports.ubuntu.com/ubuntu-ports jammy/main arm64 libjs-jquery all 3.6.0+dfsg+~3.5.13-1 [321 kB]
Get:8 http://ports.ubuntu.com/ubuntu-ports jammy/universe arm64 libjs-jquery-mousewheel all 1:3.1.13-5 [6324 B]
Get:9 http://ports.ubuntu.com/ubuntu-ports jammy/universe arm64 libjs-jquery-ui all 1.13.1+dfsg-1 [253 kB]
Get:10 http://ports.ubuntu.com/ubuntu-ports jammy/universe arm64 libjs-jquery-timepicker all 1.6.3-1 [48.2 kB]
Get:11 http://ports.ubuntu.com/ubuntu-ports jammy/universe arm64 libjs-sizzle all 2.3.6+ds+~2.3.3-1 [32.3 kB]
Get:12 http://ports.ubuntu.com/ubuntu-ports jammy/main arm64 libjs-underscore all 1.13.2~dfsg-2 [118 kB]
Get:13 http://ports.ubuntu.com/ubuntu-ports jammy/main arm64 libjs-sphinxdoc all 4.3.2-1 [139 kB]
Get:14 http://ports.ubuntu.com/ubuntu-ports jammy/main arm64 libonig5 arm64 6.9.7.1-2build1 [169 kB]
Get:15 http://ports.ubuntu.com/ubuntu-ports jammy/universe arm64 libzip4 arm64 1.7.3-1ubuntu2 [54.4 kB]
Get:16 http://ports.ubuntu.com/ubuntu-ports jammy/universe arm64 node-jquery all 3.6.0+dfsg+~3.5.13-1 [160 kB]
Get:17 http://ports.ubuntu.com/ubuntu-ports jammy-updates/universe arm64 php8.1-bz2 arm64 8.1.2-1ubuntu2.11 [11.1 kB]
Get:18 http://ports.ubuntu.com/ubuntu-ports jammy/universe arm64 php-bz2 all 2:8.1+92ubuntu1 [1832 B]
Get:19 http://ports.ubuntu.com/ubuntu-ports jammy-updates/main arm64 php8.1-curl arm64 8.1.2-1ubuntu2.11 [38.0 kB]
Get:20 http://ports.ubuntu.com/ubuntu-ports jammy/main arm64 php-curl all 2:8.1+92ubuntu1 [1834 B]
Get:21 http://ports.ubuntu.com/ubuntu-ports jammy-updates/main arm64 php8.1-gd arm64 8.1.2-1ubuntu2.11 [31.2 kB]
Get:22 http://ports.ubuntu.com/ubuntu-ports jammy/main arm64 php-gd all 2:8.1+92ubuntu1 [1828 B]
Get:23 http://ports.ubuntu.com/ubuntu-ports jammy/universe arm64 php-google-recaptcha all 1.2.4-3 [17.1 kB]
Get:24 http://ports.ubuntu.com/ubuntu-ports jammy/main arm64 php-json all 2:8.1+92ubuntu1 [1834 B]
Get:25 http://ports.ubuntu.com/ubuntu-ports jammy/universe arm64 php-mariadb-mysql-kbs all 1.2.12-1 [31.5 kB]
Get:26 http://ports.ubuntu.com/ubuntu-ports jammy-updates/main arm64 php8.1-mbstring arm64 8.1.2-1ubuntu2.11 [479 kB]
Get:27 http://ports.ubuntu.com/ubuntu-ports jammy/universe arm64 php-mbstring all 2:8.1+92ubuntu1 [1844 B]
Get:28 http://ports.ubuntu.com/ubuntu-ports jammy-updates/main arm64 php8.1-mysql arm64 8.1.2-1ubuntu2.11 [128 kB]
Get:29 http://ports.ubuntu.com/ubuntu-ports jammy/main arm64 php-mysql all 2:8.1+92ubuntu1 [1834 B]
Get:30 http://ports.ubuntu.com/ubuntu-ports jammy/universe arm64 php-nikic-fast-route all 1.3.0-3 [13.0 kB]
Get:31 http://ports.ubuntu.com/ubuntu-ports jammy/universe arm64 php-psr-cache all 3.0.0-1 [5680 B]
Get:32 http://ports.ubuntu.com/ubuntu-ports jammy/universe arm64 php-psr-log all 3.0.0-1 [6862 B]
Get:33 http://ports.ubuntu.com/ubuntu-ports jammy/universe arm64 php-symfony-cache-contracts all 2.4.0-1ubuntu2 [7132 B]
Get:34 http://ports.ubuntu.com/ubuntu-ports jammy/universe arm64 php-symfony-deprecation-contracts all 2.4.0-1ubuntu2 [4700 B]
Get:35 http://ports.ubuntu.com/ubuntu-ports jammy/universe arm64 php-symfony-polyfill-php80 all 1.24.0-1ubuntu2 [6642 B]
Get:36 http://ports.ubuntu.com/ubuntu-ports jammy/universe arm64 php-psr-container all 2.0.2-1 [3878 B]
Get:37 http://ports.ubuntu.com/ubuntu-ports jammy/universe arm64 php-symfony-service-contracts all 2.4.0-1ubuntu2 [8136 B]
Get:38 http://ports.ubuntu.com/ubuntu-ports jammy/universe arm64 php-symfony-var-exporter all 5.4.4+dfsg-1ubuntu8 [19.1 kB]
Get:39 http://ports.ubuntu.com/ubuntu-ports jammy/universe arm64 php-symfony-cache all 5.4.4+dfsg-1ubuntu8 [56.9 kB]
Get:40 http://ports.ubuntu.com/ubuntu-ports jammy/universe arm64 php-symfony-expression-language all 5.4.4+dfsg-1ubuntu8 [21.0 kB]
Get:41 http://ports.ubuntu.com/ubuntu-ports jammy/universe arm64 php-phpmyadmin-motranslator all 5.2.0-1build1 [11.5 kB]
Get:42 http://ports.ubuntu.com/ubuntu-ports jammy/universe arm64 php-phpmyadmin-shapefile all 2.1-5 [45.1 kB]
Get:43 http://ports.ubuntu.com/ubuntu-ports jammy/universe arm64 php-phpmyadmin-sql-parser all 5.4.1-2 [75.8 kB]
Get:44 http://ports.ubuntu.com/ubuntu-ports jammy/universe arm64 php-phpseclib all 2.0.36-1 [198 kB]
Get:45 http://ports.ubuntu.com/ubuntu-ports jammy/universe arm64 php-symfony-filesystem all 5.4.4+dfsg-1ubuntu8 [23.9 kB]
Get:46 http://ports.ubuntu.com/ubuntu-ports jammy/universe arm64 php-symfony-polyfill-php81 all 1.24.0-1ubuntu2 [5218 B]
Get:47 http://ports.ubuntu.com/ubuntu-ports jammy/universe arm64 php-symfony-config all 5.4.4+dfsg-1ubuntu8 [49.7 kB]
Get:48 http://ports.ubuntu.com/ubuntu-ports jammy/universe arm64 php-symfony-dependency-injection all 5.4.4+dfsg-1ubuntu8 [115 kB]
Get:49 http://ports.ubuntu.com/ubuntu-ports jammy/universe arm64 php-tcpdf all 6.4.4+dfsg1-1 [8063 kB]
Get:50 http://ports.ubuntu.com/ubuntu-ports jammy/universe arm64 php-twig all 3.3.8-2ubuntu4 [83.4 kB]
Get:51 http://ports.ubuntu.com/ubuntu-ports jammy/universe arm64 php-twig-i18n-extension all 3.0.0-2 [7756 B]
Get:52 http://ports.ubuntu.com/ubuntu-ports jammy-updates/main arm64 php8.1-xml arm64 8.1.2-1ubuntu2.11 [114 kB]
Get:53 http://ports.ubuntu.com/ubuntu-ports jammy/main arm64 php-xml all 2:8.1+92ubuntu1 [1850 B]
Get:54 http://ports.ubuntu.com/ubuntu-ports jammy-updates/universe arm64 php8.1-zip arm64 8.1.2-1ubuntu2.11 [25.9 kB]
Get:55 http://ports.ubuntu.com/ubuntu-ports jammy/universe arm64 php-zip all 2:8.1+92ubuntu1 [1830 B]
Get:56 http://ports.ubuntu.com/ubuntu-ports jammy/universe arm64 libjs-codemirror all 5.65.0+~cs5.83.9-1 [757 kB]
Get:57 http://ports.ubuntu.com/ubuntu-ports jammy/universe arm64 phpmyadmin all 4:5.1.1+dfsg1-5ubuntu1 [4937 kB]
Fetched 18.1 MB in 12s (1487 kB/s)
debconf: delaying package configuration, since apt-utils is not installed
Selecting previously unselected package dbconfig-common.
(Reading database ... 70892 files and directories currently installed.)
Preparing to unpack .../00-dbconfig-common_2.0.21_all.deb ...
Unpacking dbconfig-common (2.0.21) ...
Selecting previously unselected package dbconfig-mysql.
Preparing to unpack .../01-dbconfig-mysql_2.0.21_all.deb ...
Unpacking dbconfig-mysql (2.0.21) ...
Selecting previously unselected package icc-profiles-free.
Preparing to unpack .../02-icc-profiles-free_2.0.1+dfsg-1.1_all.deb ...
Unpacking icc-profiles-free (2.0.1+dfsg-1.1) ...
Selecting previously unselected package javascript-common.
Preparing to unpack .../03-javascript-common_11+nmu1_all.deb ...
Unpacking javascript-common (11+nmu1) ...
Selecting previously unselected package libjs-popper.js.
Preparing to unpack .../04-libjs-popper.js_1.16.1+ds-5_all.deb ...
Unpacking libjs-popper.js (1.16.1+ds-5) ...
Selecting previously unselected package libjs-bootstrap4.
Preparing to unpack .../05-libjs-bootstrap4_4.6.0+dfsg1-4_all.deb ...
Unpacking libjs-bootstrap4 (4.6.0+dfsg1-4) ...
Selecting previously unselected package libjs-jquery.
Preparing to unpack .../06-libjs-jquery_3.6.0+dfsg+~3.5.13-1_all.deb ...
Unpacking libjs-jquery (3.6.0+dfsg+~3.5.13-1) ...
Selecting previously unselected package libjs-jquery-mousewheel.
Preparing to unpack .../07-libjs-jquery-mousewheel_1%3a3.1.13-5_all.deb ...
Unpacking libjs-jquery-mousewheel (1:3.1.13-5) ...
Selecting previously unselected package libjs-jquery-ui.
Preparing to unpack .../08-libjs-jquery-ui_1.13.1+dfsg-1_all.deb ...
Unpacking libjs-jquery-ui (1.13.1+dfsg-1) ...
Selecting previously unselected package libjs-jquery-timepicker.
Preparing to unpack .../09-libjs-jquery-timepicker_1.6.3-1_all.deb ...
Unpacking libjs-jquery-timepicker (1.6.3-1) ...
Selecting previously unselected package libjs-sizzle.
Preparing to unpack .../10-libjs-sizzle_2.3.6+ds+~2.3.3-1_all.deb ...
Unpacking libjs-sizzle (2.3.6+ds+~2.3.3-1) ...
Selecting previously unselected package libjs-underscore.
Preparing to unpack .../11-libjs-underscore_1.13.2~dfsg-2_all.deb ...
Unpacking libjs-underscore (1.13.2~dfsg-2) ...
Selecting previously unselected package libjs-sphinxdoc.
Preparing to unpack .../12-libjs-sphinxdoc_4.3.2-1_all.deb ...
Unpacking libjs-sphinxdoc (4.3.2-1) ...
Selecting previously unselected package libonig5:arm64.
Preparing to unpack .../13-libonig5_6.9.7.1-2build1_arm64.deb ...
Unpacking libonig5:arm64 (6.9.7.1-2build1) ...
Selecting previously unselected package libzip4:arm64.
Preparing to unpack .../14-libzip4_1.7.3-1ubuntu2_arm64.deb ...
Unpacking libzip4:arm64 (1.7.3-1ubuntu2) ...
Selecting previously unselected package node-jquery.
Preparing to unpack .../15-node-jquery_3.6.0+dfsg+~3.5.13-1_all.deb ...
Unpacking node-jquery (3.6.0+dfsg+~3.5.13-1) ...
Selecting previously unselected package php8.1-bz2.
Preparing to unpack .../16-php8.1-bz2_8.1.2-1ubuntu2.11_arm64.deb ...
Unpacking php8.1-bz2 (8.1.2-1ubuntu2.11) ...
Selecting previously unselected package php-bz2.
Preparing to unpack .../17-php-bz2_2%3a8.1+92ubuntu1_all.deb ...
Unpacking php-bz2 (2:8.1+92ubuntu1) ...
Selecting previously unselected package php8.1-curl.
Preparing to unpack .../18-php8.1-curl_8.1.2-1ubuntu2.11_arm64.deb ...
Unpacking php8.1-curl (8.1.2-1ubuntu2.11) ...
Selecting previously unselected package php-curl.
Preparing to unpack .../19-php-curl_2%3a8.1+92ubuntu1_all.deb ...
Unpacking php-curl (2:8.1+92ubuntu1) ...
Selecting previously unselected package php8.1-gd.
Preparing to unpack .../20-php8.1-gd_8.1.2-1ubuntu2.11_arm64.deb ...
Unpacking php8.1-gd (8.1.2-1ubuntu2.11) ...
Selecting previously unselected package php-gd.
Preparing to unpack .../21-php-gd_2%3a8.1+92ubuntu1_all.deb ...
Unpacking php-gd (2:8.1+92ubuntu1) ...
Selecting previously unselected package php-google-recaptcha.
Preparing to unpack .../22-php-google-recaptcha_1.2.4-3_all.deb ...
Unpacking php-google-recaptcha (1.2.4-3) ...
Selecting previously unselected package php-json.
Preparing to unpack .../23-php-json_2%3a8.1+92ubuntu1_all.deb ...
Unpacking php-json (2:8.1+92ubuntu1) ...
Selecting previously unselected package php-mariadb-mysql-kbs.
Preparing to unpack .../24-php-mariadb-mysql-kbs_1.2.12-1_all.deb ...
Unpacking php-mariadb-mysql-kbs (1.2.12-1) ...
Selecting previously unselected package php8.1-mbstring.
Preparing to unpack .../25-php8.1-mbstring_8.1.2-1ubuntu2.11_arm64.deb ...
Unpacking php8.1-mbstring (8.1.2-1ubuntu2.11) ...
Selecting previously unselected package php-mbstring.
Preparing to unpack .../26-php-mbstring_2%3a8.1+92ubuntu1_all.deb ...
Unpacking php-mbstring (2:8.1+92ubuntu1) ...
Selecting previously unselected package php8.1-mysql.
Preparing to unpack .../27-php8.1-mysql_8.1.2-1ubuntu2.11_arm64.deb ...
Unpacking php8.1-mysql (8.1.2-1ubuntu2.11) ...
Selecting previously unselected package php-mysql.
Preparing to unpack .../28-php-mysql_2%3a8.1+92ubuntu1_all.deb ...
Unpacking php-mysql (2:8.1+92ubuntu1) ...
Selecting previously unselected package php-nikic-fast-route.
Preparing to unpack .../29-php-nikic-fast-route_1.3.0-3_all.deb ...
Unpacking php-nikic-fast-route (1.3.0-3) ...
Selecting previously unselected package php-psr-cache.
Preparing to unpack .../30-php-psr-cache_3.0.0-1_all.deb ...
Unpacking php-psr-cache (3.0.0-1) ...
Selecting previously unselected package php-psr-log.
Preparing to unpack .../31-php-psr-log_3.0.0-1_all.deb ...
Unpacking php-psr-log (3.0.0-1) ...
Selecting previously unselected package php-symfony-cache-contracts.
Preparing to unpack .../32-php-symfony-cache-contracts_2.4.0-1ubuntu2_all.deb ...
Unpacking php-symfony-cache-contracts (2.4.0-1ubuntu2) ...
Selecting previously unselected package php-symfony-deprecation-contracts.
Preparing to unpack .../33-php-symfony-deprecation-contracts_2.4.0-1ubuntu2_all.deb ...
Unpacking php-symfony-deprecation-contracts (2.4.0-1ubuntu2) ...
Selecting previously unselected package php-symfony-polyfill-php80.
Preparing to unpack .../34-php-symfony-polyfill-php80_1.24.0-1ubuntu2_all.deb ...
Unpacking php-symfony-polyfill-php80 (1.24.0-1ubuntu2) ...
Selecting previously unselected package php-psr-container.
Preparing to unpack .../35-php-psr-container_2.0.2-1_all.deb ...
Unpacking php-psr-container (2.0.2-1) ...
Selecting previously unselected package php-symfony-service-contracts.
Preparing to unpack .../36-php-symfony-service-contracts_2.4.0-1ubuntu2_all.deb ...
Unpacking php-symfony-service-contracts (2.4.0-1ubuntu2) ...
Selecting previously unselected package php-symfony-var-exporter.
Preparing to unpack .../37-php-symfony-var-exporter_5.4.4+dfsg-1ubuntu8_all.deb ...
Unpacking php-symfony-var-exporter (5.4.4+dfsg-1ubuntu8) ...
Selecting previously unselected package php-symfony-cache.
Preparing to unpack .../38-php-symfony-cache_5.4.4+dfsg-1ubuntu8_all.deb ...
Unpacking php-symfony-cache (5.4.4+dfsg-1ubuntu8) ...
Selecting previously unselected package php-symfony-expression-language.
Preparing to unpack .../39-php-symfony-expression-language_5.4.4+dfsg-1ubuntu8_all.deb ...
Unpacking php-symfony-expression-language (5.4.4+dfsg-1ubuntu8) ...
Selecting previously unselected package php-phpmyadmin-motranslator.
Preparing to unpack .../40-php-phpmyadmin-motranslator_5.2.0-1build1_all.deb ...
Unpacking php-phpmyadmin-motranslator (5.2.0-1build1) ...
Selecting previously unselected package php-phpmyadmin-shapefile.
Preparing to unpack .../41-php-phpmyadmin-shapefile_2.1-5_all.deb ...
Unpacking php-phpmyadmin-shapefile (2.1-5) ...
Selecting previously unselected package php-phpmyadmin-sql-parser.
Preparing to unpack .../42-php-phpmyadmin-sql-parser_5.4.1-2_all.deb ...
Unpacking php-phpmyadmin-sql-parser (5.4.1-2) ...
Selecting previously unselected package php-phpseclib.
Preparing to unpack .../43-php-phpseclib_2.0.36-1_all.deb ...
Unpacking php-phpseclib (2.0.36-1) ...
Selecting previously unselected package php-symfony-filesystem.
Preparing to unpack .../44-php-symfony-filesystem_5.4.4+dfsg-1ubuntu8_all.deb ...
Unpacking php-symfony-filesystem (5.4.4+dfsg-1ubuntu8) ...
Selecting previously unselected package php-symfony-polyfill-php81.
Preparing to unpack .../45-php-symfony-polyfill-php81_1.24.0-1ubuntu2_all.deb ...
Unpacking php-symfony-polyfill-php81 (1.24.0-1ubuntu2) ...
Selecting previously unselected package php-symfony-config.
Preparing to unpack .../46-php-symfony-config_5.4.4+dfsg-1ubuntu8_all.deb ...
Unpacking php-symfony-config (5.4.4+dfsg-1ubuntu8) ...
Selecting previously unselected package php-symfony-dependency-injection.
Preparing to unpack .../47-php-symfony-dependency-injection_5.4.4+dfsg-1ubuntu8_all.deb ...
Unpacking php-symfony-dependency-injection (5.4.4+dfsg-1ubuntu8) ...
Selecting previously unselected package php-tcpdf.
Preparing to unpack .../48-php-tcpdf_6.4.4+dfsg1-1_all.deb ...
Unpacking php-tcpdf (6.4.4+dfsg1-1) ...
Selecting previously unselected package php-twig.
Preparing to unpack .../49-php-twig_3.3.8-2ubuntu4_all.deb ...
Unpacking php-twig (3.3.8-2ubuntu4) ...
Selecting previously unselected package php-twig-i18n-extension.
Preparing to unpack .../50-php-twig-i18n-extension_3.0.0-2_all.deb ...
Unpacking php-twig-i18n-extension (3.0.0-2) ...
Selecting previously unselected package php8.1-xml.
Preparing to unpack .../51-php8.1-xml_8.1.2-1ubuntu2.11_arm64.deb ...
Unpacking php8.1-xml (8.1.2-1ubuntu2.11) ...
Selecting previously unselected package php-xml.
Preparing to unpack .../52-php-xml_2%3a8.1+92ubuntu1_all.deb ...
Unpacking php-xml (2:8.1+92ubuntu1) ...
Selecting previously unselected package php8.1-zip.
Preparing to unpack .../53-php8.1-zip_8.1.2-1ubuntu2.11_arm64.deb ...
Unpacking php8.1-zip (8.1.2-1ubuntu2.11) ...
Selecting previously unselected package php-zip.
Preparing to unpack .../54-php-zip_2%3a8.1+92ubuntu1_all.deb ...
Unpacking php-zip (2:8.1+92ubuntu1) ...
Selecting previously unselected package libjs-codemirror.
Preparing to unpack .../55-libjs-codemirror_5.65.0+~cs5.83.9-1_all.deb ...
Unpacking libjs-codemirror (5.65.0+~cs5.83.9-1) ...
Selecting previously unselected package phpmyadmin.
Preparing to unpack .../56-phpmyadmin_4%3a5.1.1+dfsg1-5ubuntu1_all.deb ...
Unpacking phpmyadmin (4:5.1.1+dfsg1-5ubuntu1) ...
Setting up javascript-common (11+nmu1) ...
apache2_invoke: Enable configuration javascript-common
apache2.service is not active, cannot reload.
invoke-rc.d: initscript apache2, action "reload" failed.
Setting up libjs-popper.js (1.16.1+ds-5) ...
Setting up php8.1-bz2 (8.1.2-1ubuntu2.11) ...
debconf: unable to initialize frontend: Dialog
debconf: (No usable dialog-like program is installed, so the dialog based frontend cannot be used. at /usr/share/perl5/Debconf/FrontEnd/Dialog.pm line 78.)
debconf: falling back to frontend: Readline

Creating config file /etc/php/8.1/mods-available/bz2.ini with new version
Setting up php-json (2:8.1+92ubuntu1) ...
Setting up php-bz2 (2:8.1+92ubuntu1) ...
Setting up php-phpmyadmin-shapefile (2.1-5) ...
Setting up libzip4:arm64 (1.7.3-1ubuntu2) ...
Setting up php-psr-container (2.0.2-1) ...
Setting up php8.1-gd (8.1.2-1ubuntu2.11) ...
debconf: unable to initialize frontend: Dialog
debconf: (No usable dialog-like program is installed, so the dialog based frontend cannot be used. at /usr/share/perl5/Debconf/FrontEnd/Dialog.pm line 78.)
debconf: falling back to frontend: Readline

Creating config file /etc/php/8.1/mods-available/gd.ini with new version
Setting up libjs-jquery-mousewheel (1:3.1.13-5) ...
Setting up php-symfony-service-contracts (2.4.0-1ubuntu2) ...
Setting up dbconfig-common (2.0.21) ...
debconf: unable to initialize frontend: Dialog
debconf: (No usable dialog-like program is installed, so the dialog based frontend cannot be used. at /usr/share/perl5/Debconf/FrontEnd/Dialog.pm line 78.)
debconf: falling back to frontend: Readline

Creating config file /etc/dbconfig-common/config with new version
Setting up php-mariadb-mysql-kbs (1.2.12-1) ...
Setting up libjs-sizzle (2.3.6+ds+~2.3.3-1) ...
Setting up php8.1-curl (8.1.2-1ubuntu2.11) ...
debconf: unable to initialize frontend: Dialog
debconf: (No usable dialog-like program is installed, so the dialog based frontend cannot be used. at /usr/share/perl5/Debconf/FrontEnd/Dialog.pm line 78.)
debconf: falling back to frontend: Readline

Creating config file /etc/php/8.1/mods-available/curl.ini with new version
Setting up php-phpseclib (2.0.36-1) ...
Setting up php8.1-xml (8.1.2-1ubuntu2.11) ...
debconf: unable to initialize frontend: Dialog
debconf: (No usable dialog-like program is installed, so the dialog based frontend cannot be used. at /usr/share/perl5/Debconf/FrontEnd/Dialog.pm line 78.)
debconf: falling back to frontend: Readline

Creating config file /etc/php/8.1/mods-available/dom.ini with new version
debconf: unable to initialize frontend: Dialog
debconf: (No usable dialog-like program is installed, so the dialog based frontend cannot be used. at /usr/share/perl5/Debconf/FrontEnd/Dialog.pm line 78.)
debconf: falling back to frontend: Readline

Creating config file /etc/php/8.1/mods-available/simplexml.ini with new version
debconf: unable to initialize frontend: Dialog
debconf: (No usable dialog-like program is installed, so the dialog based frontend cannot be used. at /usr/share/perl5/Debconf/FrontEnd/Dialog.pm line 78.)
debconf: falling back to frontend: Readline

Creating config file /etc/php/8.1/mods-available/xml.ini with new version
debconf: unable to initialize frontend: Dialog
debconf: (No usable dialog-like program is installed, so the dialog based frontend cannot be used. at /usr/share/perl5/Debconf/FrontEnd/Dialog.pm line 78.)
debconf: falling back to frontend: Readline

Creating config file /etc/php/8.1/mods-available/xmlreader.ini with new version
debconf: unable to initialize frontend: Dialog
debconf: (No usable dialog-like program is installed, so the dialog based frontend cannot be used. at /usr/share/perl5/Debconf/FrontEnd/Dialog.pm line 78.)
debconf: falling back to frontend: Readline

Creating config file /etc/php/8.1/mods-available/xmlwriter.ini with new version
debconf: unable to initialize frontend: Dialog
debconf: (No usable dialog-like program is installed, so the dialog based frontend cannot be used. at /usr/share/perl5/Debconf/FrontEnd/Dialog.pm line 78.)
debconf: falling back to frontend: Readline

Creating config file /etc/php/8.1/mods-available/xsl.ini with new version
Setting up php8.1-mysql (8.1.2-1ubuntu2.11) ...
debconf: unable to initialize frontend: Dialog
debconf: (No usable dialog-like program is installed, so the dialog based frontend cannot be used. at /usr/share/perl5/Debconf/FrontEnd/Dialog.pm line 78.)
debconf: falling back to frontend: Readline

Creating config file /etc/php/8.1/mods-available/mysqlnd.ini with new version
debconf: unable to initialize frontend: Dialog
debconf: (No usable dialog-like program is installed, so the dialog based frontend cannot be used. at /usr/share/perl5/Debconf/FrontEnd/Dialog.pm line 78.)
debconf: falling back to frontend: Readline

Creating config file /etc/php/8.1/mods-available/mysqli.ini with new version
debconf: unable to initialize frontend: Dialog
debconf: (No usable dialog-like program is installed, so the dialog based frontend cannot be used. at /usr/share/perl5/Debconf/FrontEnd/Dialog.pm line 78.)
debconf: falling back to frontend: Readline

Creating config file /etc/php/8.1/mods-available/pdo_mysql.ini with new version
Setting up libjs-codemirror (5.65.0+~cs5.83.9-1) ...
Setting up icc-profiles-free (2.0.1+dfsg-1.1) ...
Setting up php-psr-cache (3.0.0-1) ...
Setting up php-psr-log (3.0.0-1) ...
Setting up php-nikic-fast-route (1.3.0-3) ...
Setting up php-symfony-polyfill-php80 (1.24.0-1ubuntu2) ...
Setting up php8.1-zip (8.1.2-1ubuntu2.11) ...
debconf: unable to initialize frontend: Dialog
debconf: (No usable dialog-like program is installed, so the dialog based frontend cannot be used. at /usr/share/perl5/Debconf/FrontEnd/Dialog.pm line 78.)
debconf: falling back to frontend: Readline

Creating config file /etc/php/8.1/mods-available/zip.ini with new version
Setting up php-symfony-polyfill-php81 (1.24.0-1ubuntu2) ...
Setting up php-gd (2:8.1+92ubuntu1) ...
Setting up libjs-bootstrap4 (4.6.0+dfsg1-4) ...
Setting up php-google-recaptcha (1.2.4-3) ...
Setting up php-symfony-var-exporter (5.4.4+dfsg-1ubuntu8) ...
Setting up libjs-jquery (3.6.0+dfsg+~3.5.13-1) ...
Setting up libonig5:arm64 (6.9.7.1-2build1) ...
Setting up node-jquery (3.6.0+dfsg+~3.5.13-1) ...
Setting up libjs-underscore (1.13.2~dfsg-2) ...
Setting up php-symfony-deprecation-contracts (2.4.0-1ubuntu2) ...
Setting up php-xml (2:8.1+92ubuntu1) ...
Setting up php-curl (2:8.1+92ubuntu1) ...
Setting up php-mysql (2:8.1+92ubuntu1) ...
Setting up php-symfony-cache-contracts (2.4.0-1ubuntu2) ...
Setting up php-tcpdf (6.4.4+dfsg1-1) ...
Setting up php8.1-mbstring (8.1.2-1ubuntu2.11) ...
debconf: unable to initialize frontend: Dialog
debconf: (No usable dialog-like program is installed, so the dialog based frontend cannot be used. at /usr/share/perl5/Debconf/FrontEnd/Dialog.pm line 78.)
debconf: falling back to frontend: Readline

Creating config file /etc/php/8.1/mods-available/mbstring.ini with new version
Setting up php-symfony-dependency-injection (5.4.4+dfsg-1ubuntu8) ...
Setting up dbconfig-mysql (2.0.21) ...
Setting up php-mbstring (2:8.1+92ubuntu1) ...
Setting up libjs-jquery-ui (1.13.1+dfsg-1) ...
Setting up php-symfony-filesystem (5.4.4+dfsg-1ubuntu8) ...
Setting up php-symfony-cache (5.4.4+dfsg-1ubuntu8) ...
Setting up php-symfony-expression-language (5.4.4+dfsg-1ubuntu8) ...
Setting up php-phpmyadmin-sql-parser (5.4.1-2) ...
Setting up php-twig (3.3.8-2ubuntu4) ...
Setting up libjs-sphinxdoc (4.3.2-1) ...
Setting up php-symfony-config (5.4.4+dfsg-1ubuntu8) ...
Setting up php-zip (2:8.1+92ubuntu1) ...
Setting up libjs-jquery-timepicker (1.6.3-1) ...
Setting up php-twig-i18n-extension (3.0.0-2) ...
Setting up php-phpmyadmin-motranslator (5.2.0-1build1) ...
Setting up phpmyadmin (4:5.1.1+dfsg1-5ubuntu1) ...
debconf: unable to initialize frontend: Dialog
debconf: (No usable dialog-like program is installed, so the dialog based frontend cannot be used. at /usr/share/perl5/Debconf/FrontEnd/Dialog.pm line 78.)
debconf: falling back to frontend: Readline
Configuring phpmyadmin
----------------------

The phpmyadmin package must have a database installed and configured before it can be used. This
can be optionally handled with dbconfig-common.

If you are an advanced database administrator and know that you want to perform this configuration
manually, or if your database has already been installed and configured, you should refuse this
option. Details on what needs to be done should most likely be provided in
/usr/share/doc/phpmyadmin.

Otherwise, you should probably choose this option.

Configure database for phpmyadmin with dbconfig-common? [yes/no] yes

Please provide a password for phpmyadmin to register with the database server. If left blank, a
random password will be generated.

MySQL application password for phpmyadmin:

Password confirmation:

Determining localhost credentials from /etc/mysql/debian.cnf: succeeded.
Please choose the web server that should be automatically configured to run phpMyAdmin.

  1. apache2  2. lighttpd

(Enter the items or ranges you want to select, separated by spaces.)

Web server to reconfigure automatically:

dbconfig-common: writing config to /etc/dbconfig-common/phpmyadmin.conf

Creating config file /etc/dbconfig-common/phpmyadmin.conf with new version

Creating config file /etc/phpmyadmin/config-db.php with new version
checking privileges on database phpmyadmin for phpmyadmin@localhost: user creation needed.
granting access to database phpmyadmin for phpmyadmin@localhost: success.
verifying access for phpmyadmin@localhost: success.
creating database phpmyadmin: success.
verifying database phpmyadmin exists: success.
populating database via sql...  done.
dbconfig-common: flushing administrative password
Processing triggers for libapache2-mod-php8.1 (8.1.2-1ubuntu2.11) ...
Processing triggers for libc-bin (2.35-0ubuntu3.1) ...
Processing triggers for php8.1-fpm (8.1.2-1ubuntu2.11) ...
NOTICE: Not enabling PHP 8.1 FPM by default.
NOTICE: To enable PHP 8.1 FPM in Apache2 do:
NOTICE: a2enmod proxy_fcgi setenvif
NOTICE: a2enconf php8.1-fpm
NOTICE: You are seeing this message because you have apache2 package installed.
Processing triggers for php8.1-cli (8.1.2-1ubuntu2.11) ...
debconf: unable to initialize frontend: Dialog
debconf: (No usable dialog-like program is installed, so the dialog based frontend cannot be used. at /usr/share/perl5/Debconf/FrontEnd/Dialog.pm line 78.)
debconf: falling back to frontend: Readline
Scanning processes...
Scanning linux images...

Running kernel seems to be up-to-date.

No services need to be restarted.

No containers need to be restarted.

No user sessions are running outdated binaries.

No VM guests are running outdated hypervisor (qemu) binaries on this host.
lex@gblex:/etc/nginx/sites-available$
lex@gblex:/etc/nginx/sites-available$
lex@gblex:/etc/nginx/sites-available$
lex@gblex:/etc/nginx/sites-available$
lex@gblex:/etc/nginx/sites-available$ systemctl status phpmyadmin
Unit phpmyadmin.service could not be found.
lex@gblex:/etc/nginx/sites-available$
lex@gblex:/etc/nginx/sites-available$
lex@gblex:/etc/nginx/sites-available$
lex@gblex:/etc/nginx/sites-available$ ls -l /usr/share | grep phpmyadmin
drwxr-xr-x   9 root root  4096 Jun 21 09:43 phpmyadmin
lex@gblex:/etc/nginx/sites-available$
lex@gblex:/etc/nginx/sites-available$
lex@gblex:/etc/nginx/sites-available$ cd ~
lex@gblex:~$
lex@gblex:~$
lex@gblex:~$ sudo ln -s /usr/share/phpmyadmin/ /var/www/html/
lex@gblex:~$
lex@gblex:~$
lex@gblex:~$
lex@gblex:~$
lex@gblex:~$ ls -la /var/www/html
total 28
drwxr-xr-x 3 root root  4096 Jun 21 09:47 .
drwxr-xr-x 3 root root  4096 Jun 20 04:28 ..
-rw-r--r-- 1 root root 10671 Jun 20 05:38 index.html
-rw-r--r-- 1 root root   612 Jun 20 04:28 index.nginx-debian.html
drwxr-xr-x 2 root root  4096 Jun 20 07:48 php-fpm.test
lrwxrwxrwx 1 root root    22 Jun 21 09:47 phpmyadmin -> /usr/share/phpmyadmin/
lex@gblex:~$
lex@gblex:~$
lex@gblex:~$
