# 3 Настроить схему обратного прокси для Nginx (динамика - на Apache).

схема reverce-proxy fнстраивается со стороны Nginx.
Aapahe rак работал, так и продолжает работать.

Меняем конфиг сайтов для Nginx

Заходим в папку **/etc/nginx/sites-available/** и правим файл **default**

```bash
cd /etc/nginx/sites-available/
sudo nano default
```

добавляем блок кода reverce-proxy для отправки php-скриптов на апач

и приёма отрендереных text/html файлов обратно на nginx

наш apache работает на порту 8080 и поэтому адрес для **proxy_pass** пишем **http://localhost:8080**

это редиректы внутри нашей ОСи сервера,

и nginx и Apache крутятся в нашей ОСи на разных портах, поэтому **127.0.0.1**

здесь только для php-скриптов

```bash
# Dynamic query to Apache
	location ~ \.php {
		proxy_pass http://localhost:8080;
		proxy_set_header Host $host;
		proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
		proxy_set_header X-Real-IP $remote_addr;
	}
```

Проверяем синтаксис, не наделали ли ошибок

```bash
sudo nginx -t
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
nginx: configuration file /etc/nginx/nginx.conf test is successful
```

Рестартуем nginx чтобы подтянулся измененный конфиг

```bash
systemctl reload nginx
```

Можно редиректить на apache вообще все, кроме статики.

Т.е. любые скрипты, не только php

Тогда надо оставить корень и убрать регулярку с php в конфиге

```bash
lex@gblex:/etc/nginx/sites-available$ cat default
server {
	listen 80 default_server;
	listen [::]:80 default_server;

	root /var/www/html;

	# Add index.php to the list if you are using PHP
	index index.html index.htm index.php index.nginx-debian.html;

	server_name _;

	location / {
		# First attempt to serve request as file, then
		# as directory, then fall back to displaying a 404.
		proxy_pass http://localhost:8080;
		proxy_set_header Host $host;
		proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
		proxy_set_header X-Real-IP $remote_addr;
		try_files $uri $uri/ =404;
	}

	# pass PHP scripts to FastCGI server

	#location ~ \.php$ {
	#	include snippets/fastcgi-php.conf;
	#
	#	root /var/www/html;
	#	# With php-fpm (or other unix sockets):
	#	fastcgi_pass unix:/run/php/php8.1-fpm.sock;
	#	# With php-cgi (or other tcp sockets):
	#	fastcgi_pass 127.0.0.1:9000;
	#}


	# Dynamic query to Apache
	#
	#location ~ \.php$ {
	#	proxy_pass http://localhost:8080;
	#	proxy_set_header Host $host;
	#	proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
	#	proxy_set_header X-Real-IP $remote_addr;
	#}


	# Static query
	location ~* ^.+.(jpg|jpeg|gif|png|ico|css|zip|pdf|txt|tar|js)$ {
		root /var/www/html;
	}
}
```

заходим на наш сервер nginx на 80 порту снаружи

на адресе **http://192.168.1.100/php-fpm.test/** открывается страница с phpinfo(), потому что nginx теперь редиректит скрипты php на apache и получает обратно сгенерированный text/html.
