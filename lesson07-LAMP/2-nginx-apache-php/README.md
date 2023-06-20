# 2 Установить Apache. Настроить обработку PHP. Добиться одновременной работы с Nginx.

установим сервер апач

```bash
sudo apt install apache2
```

проверяем синтаксис

```bash
sudo apachectl -t
AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 127.0.1.1. Set the 'ServerName' directive globally to suppress this message
Syntax OK
```

установим **libapache2-mod-php<ver>** для работы апача с php

```bash
sudo apt install libapache2-mod-php8.1
```

в папке **/etc/apache2/mods-enabled/** видим два файла

```bash
php8.1.conf -> ../mods-available/php8.1.conf
php8.1.load -> ../mods-available/php8.1.load
```

смотрим внутрь файла **php8.1.conf** - там деректива для апача какой интерпретатор использовать для php

**SetHandler application/x-httpd-php**

```bash
lex@gblex:/etc/apache2/mods-enabled$ cat php8.1.conf
<FilesMatch ".+\.ph(ar|p|tml)$">
    SetHandler application/x-httpd-php
</FilesMatch>
<FilesMatch ".+\.phps$">
    SetHandler application/x-httpd-php-source
    # Deny access to raw php sources by default
    # To re-enable it's recommended to enable access to the files
    # only in specific virtual host or directory
    Require all denied
</FilesMatch>
# Deny access to files without filename (e.g. '.php')
<FilesMatch "^\.ph(ar|p|ps|tml)$">
    Require all denied
</FilesMatch>

# Running PHP scripts in user directories is disabled by default
#
# To re-enable PHP in user directories comment the following lines
# (from <IfModule ...> to </IfModule>.) Do NOT set it to On as it
# prevents .htaccess files from disabling it.
<IfModule mod_userdir.c>
    <Directory /home/*/public_html>
        php_admin_flag engine Off
    </Directory>
</IfModule>
lex@gblex:/etc/apache2/mods-enabled$
```

апач установился, но по дефолту слушает 80 порт, а этот порт уже занят nginx, поэтому имеем конфликт

переходим в папку апача

```bash
cd /etc/apache2/
```

смотрим там файлы

```bash
ls -l
```

смотрим основной конфиг апача

```bash
cat apache2.conf
```

смотрим конфиг портов

```bash
cat ports.conf
```

отредактируем порты, чтобы апач слушал не 80 порт, а например порт 8080

```bash
sudo nano ports.conf
```

смотрим на исправленный файл

```bash
cat ports.conf

Listen 8080

<IfModule ssl_module>
	Listen 443
</IfModule>

<IfModule mod_gnutls.c>
	Listen 443
</IfModule>
```

еще порт прописываем в файле **/etc/apache2/sites-available/000-default.conf**

```bash
<VirtualHost *:8080>
	# The ServerName directive sets the request scheme, hostname and port that
	# the server uses to identify itself. This is used when creating
	# redirection URLs. In the context of virtual hosts, the ServerName
	# specifies what hostname must appear in the request's Host: header to
	# match this virtual host. For the default virtual host (this file) this
	# value is not decisive as it is used as a last resort host regardless.
	# However, you must set it for any further virtual host explicitly.
	#ServerName www.example.com

	ServerAdmin webmaster@localhost
	DocumentRoot /var/www/html

	# Available loglevels: trace8, ..., trace1, debug, info, notice, warn,
	# error, crit, alert, emerg.
	# It is also possible to configure the loglevel for particular
	# modules, e.g.
	#LogLevel info ssl:warn

	ErrorLog ${APACHE_LOG_DIR}/error.log
	CustomLog ${APACHE_LOG_DIR}/access.log combined

	# For most configuration files from conf-available/, which are
	# enabled or disabled at a global level, it is possible to
	# include a line for only one particular virtual host. For example the
	# following line enables the CGI configuration for this host only
	# after it has been globally disabled with "a2disconf".
	#Include conf-available/serve-cgi-bin.conf
</VirtualHost>

# vim: syntax=apache ts=4 sw=4 sts=4 sr noet
```

рестартуем апач

```bash
systemctl stop apache2
systemctl start apache2
systemctl status apache2
● apache2.service - The Apache HTTP Server
     Loaded: loaded (/lib/systemd/system/apache2.service; enabled; vendor preset: enabled)
     Active: active (running) since Tue 2023-06-20 09:16:33 UTC; 11s ago
       Docs: https://httpd.apache.org/docs/2.4/
    Process: 26105 ExecStart=/usr/sbin/apachectl start (code=exited, status=0/SUCCESS)
   Main PID: 26109 (apache2)
      Tasks: 6 (limit: 9345)
     Memory: 9.9M
        CPU: 55ms
     CGroup: /system.slice/apache2.service
             ├─26109 /usr/sbin/apache2 -k start
             ├─26110 /usr/sbin/apache2 -k start
             ├─26111 /usr/sbin/apache2 -k start
             ├─26112 /usr/sbin/apache2 -k start
             ├─26113 /usr/sbin/apache2 -k start
             └─26114 /usr/sbin/apache2 -k start
```

Переходим в настройки nginx и закомментируем там обработку **php** через **FastCGI**

```bash
# pass PHP scripts to FastCGI server

#location ~ \.php$ {

# include snippets/fastcgi-php.conf;

#

# root /var/www/html;

# # With php-fpm (or other unix sockets):

# fastcgi_pass unix:/run/php/php8.1-fpm.sock;

# # With php-cgi (or other tcp sockets):

# fastcgi_pass 127.0.0.1:9000;

#}
```

рестартуем nginx

```bash
systemctl reload nginx
```

смотрим запущенные процессы, - сервера работают вместе

```bash
ps afx
    PID TTY      STAT   TIME COMMAND
...
  11375 ?        Ss     0:00 nginx: master process /usr/sbin/nginx -g daemon on; master_process on;
  26147 ?        S      0:00  \_ nginx: worker process
  26148 ?        S      0:00  \_ nginx: worker process
  26149 ?        S      0:00  \_ nginx: worker process
  26150 ?        S      0:00  \_ nginx: worker process
  26109 ?        Ss     0:00 /usr/sbin/apache2 -k start
  26110 ?        S      0:00  \_ /usr/sbin/apache2 -k start
  26111 ?        S      0:00  \_ /usr/sbin/apache2 -k start
  26112 ?        S      0:00  \_ /usr/sbin/apache2 -k start
  26113 ?        S      0:00  \_ /usr/sbin/apache2 -k start
  26114 ?        S      0:00  \_ /usr/sbin/apache2 -k start
  26117 ?        S      0:00  \_ /usr/sbin/apache2 -k start
```

смотрим прослушку портов, 80 порт слушает nginx и 8080 порт слушает apache

```bash
ss -tulpan
Netid   State    Recv-Q   Send-Q                          Local Address:Port       Peer Address:Port    Process
udp     UNCONN   0        0                               127.0.0.53%lo:53              0.0.0.0:*
udp     UNCONN   0        0                        192.168.1.100%ens160:68              0.0.0.0:*
udp     UNCONN   0        0           [fe80::20c:29ff:fe91:9cd3]%ens160:546                [::]:*
tcp     LISTEN   0        511                                   0.0.0.0:80              0.0.0.0:*
tcp     LISTEN   0        4096                            127.0.0.53%lo:53              0.0.0.0:*
tcp     LISTEN   0        128                                   0.0.0.0:22              0.0.0.0:*
tcp     ESTAB    0        0                               192.168.1.100:22         192.168.1.93:58054
tcp     LISTEN   0        511                                         *:8080                  *:*
tcp     LISTEN   0        511                                      [::]:80                 [::]:*
tcp     LISTEN   0        128                                      [::]:22                 [::]:*
```

смотрим корневую папку с сайтами

```bash
cd /var/www/html/
ls -l
total 20
-rw-r--r-- 1 root root 10671 Jun 20 05:38 index.html
-rw-r--r-- 1 root root   612 Jun 20 04:28 index.nginx-debian.html
drwxr-xr-x 2 root root  4096 Jun 20 07:48 php-fpm.test
```

и видим, что index.html от апача перезатер файл index.html от nginx. Теперь там вместо Wecome nginx написано про Apache2 Ubuntu Default Page

```html
cat /var/www/html/index.html
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <!--
    Modified from the Debian original for Ubuntu
    Last updated: 2022-03-22
    See: https://launchpad.net/bugs/1966004
  -->
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Apache2 Ubuntu Default Page: It works</title>
    ...
  </head>
  <body></body>
</html>
```

заходим на наши сервера снаружи, они разделены по портам

на адресе **http://192.168.1.100:80/php-fpm.test/** ничего не открывается, потому что nginx теперь не крутит скрипты php.

на адресе **http://192.168.1.100:8080/php-fpm.test/** открывается index.php и выводит phpinfo() потому, что там работает apache и крутит скрипты php.
