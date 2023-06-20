# Операционные системы и виртуализация (Linux) (семинары)

## Урок 6. Настройка сети в Linux. Работа с IPtables

Задание:

### 1 Настроить статическую конфигурацию (без DHCP) в Ubuntu через ip и netplan. Настроить IP, маршрут по умолчанию и DNS-сервера (1.1.1.1 и 8.8.8.8). Проверить работоспособность сети.

Используем утилиты

```
netstat
ip
netplan
```

если какой-то нет - надо установить

```
sudo apt install prog-name
```

Смотрит таблицу маршрутизации

```
netstat -r
```

видим **172.16.8.0** и **0.0.0.0**

Смотрим имя сетевого интерфейса и его адрес

```
ip a
```

видим _inet_ **172.16.8.128/24** _metric 100 brd 172.16.8.255 scope global dynamic_ **ens160**

С учетом этих данных создаем в папке
**/etc/netplan**
**.yaml** файл конфигурации

Сохраним файл **.yaml** и применим конфигурацию

```
sudo netplan apply
```

Проверим работоспособность сети

```
ping google.com
```

### 2 Настроить правила iptables для доступности сервисов на TCP-портах 22, 80 и 443. Также сервер должен иметь возможность устанавливать подключения к серверу обновлений. Остальные подключения запретить.

http://www.netfilter.org/

Посмотреть что уже есть в iptables

```
sudo iptables -L
```

Очистить все правила из iptables

```
sudo iptables -F
```

Разрешить доступ на порт по его номеру, например порт 80

```
sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT
```

Разрешить все ранее имеющиеся подключения

```
sudo iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
```

Запретить все подключения, которые не разрешены.

```
sudo iptables -P INPUT DROP
sudo iptables -P FORWARD DROP
```

Разрешить исходящие подключения, например к обновлениям

```
sudo iptables -P OUTPUT ACCEPT
```

Сохраним правила iptables

```
sudo service iptables-persistent save
```

Рестартуем сервис и проверяем статус:

```
systemctl restart iptables
systemctl status iptables
```

### 3 Запретить любой входящий трафик с IP 3.4.5.6.

```
sudo iptables -A INPUT -s 3.4.5.6 -j DROP

```

### 4 Запросы на порт 8090 перенаправлять на порт 80 (на этом же сервере).

```
sudo iptables -t nat -A PREROUTING -p tcp --dport 8090 -j REDIRECT --to-port 80
```

### 5 Разрешить подключение по SSH только из сети 192.168.0.0/24.

```
sudo iptables -A INPUT -p tcp --dport 22 -s 192.168.0.0/24 -j ACCEPT

```

Дополнительные материалы
https://www.opennet.ru/docs/RUS/iptables/
https://www.alexgur.ru/articles/5043/
