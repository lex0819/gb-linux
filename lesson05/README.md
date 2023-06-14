# Операционные системы и виртуализация (Linux) (семинары)

## Урок 5. Подключение сторонних репозиториев, ручная установка пакетов

Задание:

### 1. Подключить дополнительный репозиторий на выбор: Docker, Nginx, Oracle MySQL. Установить любой пакет из этого репозитория.

Из документации Docker для его установки нужна 64-разрядная операционная система Ubuntu одной из следующих версий, например 22.04 — кодовое имя «Jammy».

To get the codename of a Ubuntu release, use the lsb_release command.
lex@gblex:~$ lsb_release -c
Codename: jammy
lex@gblex:~$
lex@gblex:~$
lex@gblex:~$ cat /etc/os-release | grep UBUNTU_CODENAME
UBUNTU_CODENAME=jammy
lex@gblex:~$
lex@gblex:~$
lex@gblex:~$ cat /etc/lsb-release | grep CODENAME
DISTRIB_CODENAME=jammy
lex@gblex:~$

1. Обновляем индексы пакетов apt

```
sudo apt update
```

2. Устанавливаем дополнительные пакеты
   Для установки докера потребуется дополнительно загрузить 4 пакета:

curl — необходим для работы с веб-ресурсами;
software-properties-common — пакет для управления ПО с помощью скриптов;
ca-certificates — содержит информацию о центрах сертификации;
apt-transport-https — необходим для передачи данных по протоколу HTTPS.
Флаг -y означает, что на все вопросы терминала ответом будет «Да».
Скачаем их:

```
sudo apt install curl software-properties-common ca-certificates apt-transport-https -y
```

3. Импортируем GPG-ключ
   GPG-ключ нужен для верификации подписей ПО.

```
curl -f -s -S -L https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```

4. Добавляем репозиторий докера
   Добавим репозиторий для нашей версии Ubuntu, которая называется «Jammy».

```
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu jammy stable"
```

5. Eще раз обновляем индексы пакетов

```
sudo apt update
```

6. Убедимся, что инсталляция будет осуществлена из нужного нам репозитория.

```
apt-cache policy docker-ce
```

7. Устанавливаем докер

```
sudo apt install docker-ce -y
```

8. Убедимся в успешности установки, проверив статус докера в системе

```
sudo systemctl status docker
```

### 2. Установить и удалить deb-пакет с помощью dpkg.

Например установить Браузер Vivaldi
https://vivaldi.com/ru/download/

1. Для скачивания любого файла используется команда wget

```
wget https://downloads.vivaldi.com/stable/vivaldi-stable_6.1.3035.75-1_amd64.deb
```

2. Для установки пакета используем команду dpkg.

```
sudo dpkg -i vivaldi-stable_6.1.3035.75-1_amd64.deb
```

3. Посмотреть установленные пакеты

```
dpkg --get-selections
```

либо

```
apt list --installed
```

4. Удалить пакет

```
sudo apt remove vivaldi
```

либо

```
sudo apt purge Vivaldi
```

### 3. Установить и удалить snap-пакет.

1. Посмотреть список установленных пакетов в системе

```
snap list
```

2. Найти пакет по имени, например браузер Хром.

```
snap find chromium
```

3. Посмотреть информацию о пакете

```
snap info chromium
```

4. Установить пакет

```
sudo snap install chromium
```

5. Удалить пакет

```
sudo snap remove chromium
```

### 4. Добавить задачу для выполнения каждые 3 минуты (создание директории, запись в файл).

Создадим папку log для ведения логов.
Будем проверять периодически кто в моменте залогинен в системе и писать их в лог файл.

Редактирование или создание файла расписания для текущего пользователя

```
crontab -e

minute(s) hour(s) day(s) month(s) weekday(s) command(s)
```

Поля разделяются пробелами или знаками табуляции.

Запуск команды **w >> /home/lex/logs/w_log.log** каждые 3 минуты

```
*/3 * * * * w >> /home/lex/logs/w_log.log
```

### 5. Подключить PPA-репозиторий на выбор. Установить из него пакет. Удалить PPA из системы.

Установим Python версии 3.7 на ubuntu server 22.04, хотя там уже стоит Python версии 3.10.
Для этого добавим репозиторий **deadsnakes**

```
sudo add-apt-repository ppa:deadsnakes/ppa -y
```

Установим из него пакет **python3.7**

```
sudo apt install python3.7
```

Удалим репозиторий

```
sudo add-apt-repository --remove ppa:deadsnakes/ppa
```

### 6. Создать задачу резервного копирования (tar) домашнего каталога пользователя. Реализовать с использованием пользовательских crontab-файлов.

Создим общую папку **/home/backups** для бекапов пользователей,
добавим ей **sticky-bit** чтобы каждый мог удалять только свои бэкапы.

```
chmod 1777 backups
```

У пользователя создадим папку **~/bash_scripts/** и файл со скриптом бэкапирования **backup_homedir.sh**
Добавим на файл скрипта

```
chmod +x backup_homedir.sh
```

для всех, чтобы могли запускать на исполнение

Скрипт создает в папке /home/backups файл вида
[имя пользователя][дата время]--back.tar.gz
с правами на чтение-запись для хозяина и его группы.

Командой

```
crontab -e
```

добавим job с этим скриптом на выполнение по рассписанию каждую пятницу в 17-00 раз в неделю.

```
0 17 * * */5 /home/lex/bash_scripts/backup_homedir.sh
```
