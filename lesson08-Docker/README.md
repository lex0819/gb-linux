# Урок 8. Запуск веб-приложения из контейнеров

## Создадим папку для проекта **lesson08-docker**.

```sudo
mkdir lesson08-docker && cd lesson08-docker
```

## Создадим в корне проекта файл **docker-compose.yml** с настройками и описанием инструкций для **docker compose**.

## Создадим структуру папок снаружи в корень проекта, куда будем мапить нужную нам информацию изнутри контейнеров докера.

```sudo
touch docker-compose.yml
mkdir -p nginx/
mkdir -p db-data/
mkdir -p logs/
mkdir -p wordpress/
```

В папках проекта будут лежать вынесенные из контейнеров файлы, чтобы с ними было удобно работать, переносить настройки с хоста на хост.
В этом сила докера - вынести настройки наружу из виртуальной машины проблематично, а программировать внутри нее очень неудобно, для работы вообще и разработки в частности больше подходит десктоп, чем сервер.
Докер же дает готовые контейнеры популярных технологий из своего репозитория, они уже собраны и настроены. А отдельные папки и файлы, предназначеные для прикладного программирования и админских настроек, удобно вынести наружу из контейнера, чтобы писать в них свой код.

## Создадим файл **wordpress.conf** с настройками сервера для wordpress в связке в **php-fpm FASTCGI**

и положим его в папку **./nginx/wordpress.conf**

файл с настройками сервера для wordpress в связке в php-fpm FASTCGI

берем снаружи эти настройки и мапим в докер

это очень важный файл он обязан быть в папке

образ вордпресса из репозитория докера, который мы используем уже настроен на

```sudo
fastcgi_pass wordpress:9000;
```

именно это мы и прописываем в конфиге!!!

не юникс-сокет, и не localhost:8000,

а ровно то, что уже пришло к нам с контейнером вордпресс

из стандартного репозитория докер.

конфигурация сервера nginx, добавление **php-fpm** и обработку скриптов через **FASTCGI**

```sudo
./nginx:/etc/nginx/conf.d
```

## запись логов сервера nginx снаружи в папке **./logs**

```sudo
./logs:/var/log/nginx
```

## папки сайта на вордпресса, приходится тянуть весь вордпресс целиком

программисту там нужны только файл из корня wp-config.php

и папка с темой и плагинами wp-content

папки wp-admin wp-include надо добавить в .gitignore

чтобы не лезли в комиты

```sudo
./wordpress:/var/www/html
```

## папка таблиц базы данных mysql

```sudo
./db-data:/var/lib/mysql
```

## контейнер с **phpmyadmin** также работает внутри докера без изменений.

## Запуск docker compose

```sudo
lesson08-Docker git:(master) ✗ docker compose up -d
[+] Building 0.0s (0/0)
[+] Running 5/5
 ✔ Network lesson08-docker_default        Created                         0.0s
 ✔ Container lesson08-docker-mysql-1      Started                         0.2s
 ✔ Container lesson08-docker-pma-1        Started                         0.4s
 ✔ Container lesson08-docker-wordpress-1  Started                         0.5s
 ✔ Container lesson08-docker-nginx-1      Started                         0.6s
➜  lesson08-Docker git:(master) ✗
```

Вывести в терминал все запущенные контейнеры

```sudo
➜  lesson08-Docker git:(master) ✗ docker ps
CONTAINER ID   IMAGE                         COMMAND                  CREATED          STATUS          PORTS                     NAMES
812f4c0a9bdb   nginx:latest                  "/docker-entrypoint.…"   38 seconds ago   Up 37 seconds   0.0.0.0:8080->80/tcp      lesson08-docker-nginx-1
0ddb7573eecf   phpmyadmin                    "/docker-entrypoint.…"   38 seconds ago   Up 37 seconds   0.0.0.0:8081->80/tcp      lesson08-docker-pma-1
84caa4a069fe   wordpress:php8.1-fpm-alpine   "docker-entrypoint.s…"   38 seconds ago   Up 37 seconds   9000/tcp                  lesson08-docker-wordpress-1
2562ed8ae637   mariadb                       "docker-entrypoint.s…"   38 seconds ago   Up 38 seconds   0.0.0.0:33060->3306/tcp   lesson08-docker-mysql-1
➜  lesson08-Docker git:(master) ✗
```

Зайти в контейнер **nginx** и запустить там **bash** чтобы посмотреть что внутри.

**CONTAINER ID** берем из предыдущей команды **812f4c0a9bdb**

Выход из контейнера - **exit**

```sudo
➜  lesson08-Docker git:(master) ✗ docker exec -it 812f4c0a9bdb bash
root@812f4c0a9bdb:/#
root@812f4c0a9bdb:/# ls -l
total 60
lrwxrwxrwx   1 root root    7 Jun 12 00:00 bin -> usr/bin
drwxr-xr-x   2 root root 4096 Mar  2 13:55 boot
drwxr-xr-x   5 root root  340 Jun 25 06:19 dev
drwxr-xr-x   1 root root 4096 Jun 14 03:47 docker-entrypoint.d
-rwxrwxr-x   1 root root 1616 Jun 14 03:46 docker-entrypoint.sh
drwxr-xr-x   1 root root 4096 Jun 25 06:19 etc
drwxr-xr-x   2 root root 4096 Mar  2 13:55 home
lrwxrwxrwx   1 root root    7 Jun 12 00:00 lib -> usr/lib
drwxr-xr-x   2 root root 4096 Jun 12 00:00 media
drwxr-xr-x   2 root root 4096 Jun 12 00:00 mnt
drwxr-xr-x   2 root root 4096 Jun 12 00:00 opt
dr-xr-xr-x 229 root root    0 Jun 25 06:19 proc
drwx------   2 root root 4096 Jun 12 00:00 root
drwxr-xr-x   1 root root 4096 Jun 25 06:19 run
lrwxrwxrwx   1 root root    8 Jun 12 00:00 sbin -> usr/sbin
drwxr-xr-x   2 root root 4096 Jun 12 00:00 srv
dr-xr-xr-x  13 root root    0 Jun 25 06:19 sys
drwxrwxrwt   1 root root 4096 Jun 14 03:47 tmp
drwxr-xr-x   1 root root 4096 Jun 12 00:00 usr
drwxr-xr-x   1 root root 4096 Jun 25 06:19 var
root@812f4c0a9bdb:/#
root@812f4c0a9bdb:/# ls -l /var/www
total 0
drwxr-xr-x 24 82 82 768 Jun 25 06:06 html
root@812f4c0a9bdb:/#
root@812f4c0a9bdb:/# ls -l /var/www/html/
total 224
-rw-r--r--   1 root root   405 Jun 25 06:06 index.php
-rw-r--r--   1 root root 19915 Jun 25 06:06 license.txt
-rw-r--r--   1 root root  7402 Jun 25 06:06 readme.html
-rw-r--r--   1 root root  7205 Jun 25 06:06 wp-activate.php
drwxr-xr-x 101   82   82  3232 May 20 04:30 wp-admin
-rw-r--r--   1 root root   351 Jun 25 06:06 wp-blog-header.php
-rw-r--r--   1 root root  2338 Jun 25 06:06 wp-comments-post.php
-rw-r--r--   1 root root  5492 Jun 25 06:06 wp-config-docker.php
-rw-r--r--   1 root root  3013 Jun 25 06:06 wp-config-sample.php
-rw-r--r--   1 root root  5596 Jun 25 06:06 wp-config.php
drwxr-xr-x   7   82   82   224 Jun 25 06:06 wp-content
-rw-r--r--   1 root root  5536 Jun 25 06:06 wp-cron.php
drwxr-xr-x 251   82   82  8032 May 20 04:30 wp-includes
-rw-r--r--   1 root root  2502 Jun 25 06:06 wp-links-opml.php
-rw-r--r--   1 root root  3792 Jun 25 06:06 wp-load.php
-rw-r--r--   1 root root 49330 Jun 25 06:06 wp-login.php
-rw-r--r--   1 root root  8541 Jun 25 06:06 wp-mail.php
-rw-r--r--   1 root root 24993 Jun 25 06:06 wp-settings.php
-rw-r--r--   1 root root 34350 Jun 25 06:06 wp-signup.php
-rw-r--r--   1 root root  4889 Jun 25 06:06 wp-trackback.php
-rw-r--r--   1 root root  3238 Jun 25 06:06 xmlrpc.php
root@812f4c0a9bdb:/#
root@812f4c0a9bdb:/# exit
exit
➜  lesson08-Docker git:(master) ✗
```

Остановка docker compose

```sudo
➜  lesson08-Docker git:(master) ✗ docker compose down
[+] Running 5/4
 ✔ Container lesson08-docker-nginx-1      Removed                         0.2s
 ✔ Container lesson08-docker-pma-1        Removed                         1.2s
 ✔ Container lesson08-docker-wordpress-1  Removed                         0.1s
 ✔ Container lesson08-docker-mysql-1      Removed                         0.3s
 ✔ Network lesson08-docker_default        Removed                         0.0s
➜  lesson08-Docker git:(master) ✗
```
