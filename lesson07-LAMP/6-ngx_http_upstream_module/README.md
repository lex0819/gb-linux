# 6 Настроить схему балансировки трафика между несколькими серверами Apache на стороне Nginx с помощью модуля ngx_http_upstream_module.

Настройка Nginx в качестве балансировщика нагрузки
Создадим новый файл конфигурации для балансировщика нагрузки

```sudo
cd /etc/nginx/sites-available/
sudo nano default
```

Добавим в файл следующий код. IP-адреса серверов для примера, имя сайта тоже для примера.
В файле необходимо определить директиву upstream и server. Upstream определяет, куда Nginx будет передавать запросы после их получения. Она содержит IP-адреса группы серверов (бэкенда), на которые могут быть отправлены запросы в зависимости от выбранного метода регулирования нагрузки. По умолчанию Nginx использует метод балансировки round-robin для распределения мощности между серверами.

Сегмент server определяет порт 80, через который Nginx будет получать запросы. Он также содержит переменную proxy_pass.

```sudo
http {
   upstream appstream{
      server 10.2.0.100;
      server 10.2.0.101;
      server 10.2.0.102;
   }

   # Этот сервер принимает весь трафик на порт 80 и передает его вышестоящему потоку.
   # Обратите внимание, что имя вышестоящего потока и proxy_pass должны совпадать.

   server {
      listen 80;

      server_name mydomain.com;

      location / {
          include proxy_params;

          proxy_pass http://appstream;

          proxy_redirect off;
          proxy_http_version 1.1;
          proxy_set_header Upgrade $http_upgrade;
          proxy_set_header Connection "upgrade";
      }
   }
}
```
