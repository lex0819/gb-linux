# 1 Установить Nginx и настроить его на работу с PHP-FPM.

установим ngnix

```bash
sudo apt install nginx
```

проверим что он запустился в процессах

```bash
ps afx | grep nginx
```

проверим что он слушает порт 80 по дефолту

```bash
ss -ntlp
```

```bash
ip a
192.168.1.100
```

наша виртуальная машина торчит наружу по **IP 192.168.1.100**
Снаружи в браузере заходим на адрес **192.168.1.100:80** и попадаем на приветственную страницу nginx
![Welcome to nginx](welcome-nginx.png)

посмотрим на папку nginx

```bash
ls -l /etc/nginx
cat /etc/nginx/ngnix.conf
```

основные настройки

```bash
user www-data;
worker_processes auto;
pid /run/nginx.pid;
include /etc/nginx/modules-enabled/*.conf;

events {
	worker_connections 768;
	# multi_accept on;
}

http {

	##
	# Basic Settings
	##

	sendfile on;
	tcp_nopush on;
	types_hash_max_size 2048;
	# server_tokens off;

	# server_names_hash_bucket_size 64;
	# server_name_in_redirect off;

	include /etc/nginx/mime.types;
	default_type application/octet-stream;

	##
	# SSL Settings
	##

	ssl_protocols TLSv1 TLSv1.1 TLSv1.2 TLSv1.3; # Dropping SSLv3, ref: POODLE
	ssl_prefer_server_ciphers on;

	##
	# Logging Settings
	##

	access_log /var/log/nginx/access.log;
	error_log /var/log/nginx/error.log;

	##
	# Gzip Settings
	##

	gzip on;

	##
	# Virtual Host Configs
	##

	include /etc/nginx/conf.d/*.conf;
	include /etc/nginx/sites-enabled/*;
}
```

```
cat /etc/nginx/sites-available/default
```

настройки сайтов

```bash
server {
listen 80 default_server;
listen [::]:80 default_server;

    root /var/www/html;

    server_name _;

    location / {
    	try_files $uri $uri/ =404;
    }

}
```

посмотрим на папку с сайтами

```bash
ls -l /var/www/html
```

установим PHP по дефолту для нашей ОСи

```bash
sudo apt install php
```

узнаем версию PHP

```bash
php -v
PHP 8.1.2-1ubuntu2.11
```

по известной версии установим доп модуль php-fpm для nginx чтобы обрабатывать скрипты php

```bash
sudo apt install php8.1-fpm
```

посмотрим папку /etc/php/8.1/fpm/pool.d с настройками php-fpm

```bash
ls -l /etc/php/8.1/fpm/pool.d
cat /etc/php/8.1/fpm/pool.d/www.conf
```

находим в файле **www.conf** unix-socket, который надо слушать в nginx для php-скриптов

```bash
listen = /run/php/php8.1-fpm.sock
```

смотрим, что в nginx есть доп модуль fastcgi-php

```bash
/etc/nginx/snippets/fastcgi-php.conf
```

Переходим в настройки сайтов в nginx

```bash
cd /etc/nginx/sites-available/
```

редактируем на основе полученной информации про юникс-сокет конфиг nginx

```bash
sudo nano default
```

добавляем туда файлы index.php

добавляем обработку pph-скриптов через FastCGI server

добавляем отдачу статики

```bash
# Add index.php to the list if you are using PHP
index index.html index.htm index.php index.nginx-debian.html;

# pass PHP scripts to FastCGI server
location ~ \.php$ {
	include snippets/fastcgi-php.conf;
	root /var/www/html;
	fastcgi_pass unix:/run/php/php8.1-fpm.sock;
}

# Static query
location ~* ^.+.(jpg|jpeg|gif|png|ico|css|zip|pdf|txt|tar|js)$ {
  root /var/www/html;
}
```

```bash
sudo nginx -t
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
nginx: configuration file /etc/nginx/nginx.conf test is successful
```

Создадим новый сайт **php-fpm.test**

Сделаем для него папку в **/var/www/html**

сайты там можно раскладывать по папкам

```bash
cd /var/www/html

mkdir php-fpm.test
cd php-fpm.test/
```

для сайта создадим индексный файл **index.php**

```bash
sudo touch index.php
sudo nano index.php
```

напишем код в файле на выдачу phpinfo()

```php
<?php
	phpinfo();

```

Снаружи в браузере заходим на адрес **192.168.1.100:80/php-fpm.test/** и попадаем на приветственную страницу phpinfo(). Это отработал nginx в связке с php-fpm
![phpinfo](php-fpm.png)
