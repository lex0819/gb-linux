Установим mysql-server

```bash
sudo apt install mysql-server
```

Запустим клиента mysql

```bash
sudo mysql
```

Заходим в mysql, внутри своя среда, своё приглашение и т.д

```bash
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.33-0ubuntu0.22.04.2 (Ubuntu)

Copyright (c) 2000, 2023, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql>
```

Выведем список всех баз данных

```sql
show databases;
```

перейдём в базу данных mysql

```sql
use mysql;
```

Посмотрим все таблицы в БД mysql

```sql
show tables;
```

Посмотрим содержимое таблицы user в БД mysql

```sql
SELECT \* FROM user\G;
```

Создадим новую базу данных и назовем ее **gbtest**

```sql
CREATE DATABASE gbtest;
```

Посмотрим список всех баз данных и убедимся, что новая БД успешно создана

```sql
mysql> show databases;
+--------------------+
| Database |
+--------------------+
| gbtest |
| information_schema |
| mysql |
| performance_schema |
| sys |
+--------------------+
5 rows in set (0.00 sec)

mysql>
```

Перейдём во вновь созданную БД **gbtest**

```sql
use gbtest;
```

Создадим таблицу **courses** в БД gbtest с полями **id**, **title** и **description**

```sql
CREATE TABLE IF NOT EXISTS courses(id INT, title VARCHAR(100), description VARCHAR(255));
```

Добавим три строки данных во вновь созданную таблицу. Это три курса по программированию.

```sql
INSERT INTO courses (id, title, description) VALUES (1, 'Frontend dev', 'html, css, javascript'), (2, 'Mobile dev', 'java, kotlin, swift'), (3, 'Backend dev', 'sql, node, python');
```

Посмотрим на список таблиц в БД **gbtest** и убедимся, что таблица **courses** на месте

```sql
mysql> show tables;
+------------------+
| Tables_in_gbtest |
+------------------+
| courses |
+------------------+
1 row in set (0.01 sec)

mysql>
```

Выведем содержим таблицы **courses** и убедимся, что три строки с описанием трех курсов программирования добавлены успешно.

```sql
mysql> SELECT \* FROM courses\G; \***\*\*\*\*\*\*\***\*\*\*\***\*\*\*\*\*\*\*** 1. row \***\*\*\*\*\*\*\***\*\*\*\***\*\*\*\*\*\*\***
id: 1
title: Frontend dev
description: html, css, javascript \***\*\*\*\*\*\*\***\*\*\*\***\*\*\*\*\*\*\*** 2. row \***\*\*\*\*\*\*\***\*\*\*\***\*\*\*\*\*\*\***
id: 2
title: Mobile dev
description: java, kotlin, swift \***\*\*\*\*\*\*\***\*\*\*\***\*\*\*\*\*\*\*** 3. row \***\*\*\*\*\*\*\***\*\*\*\***\*\*\*\*\*\*\***
id: 3
title: Backend dev
description: sql, node, python
3 rows in set (0.00 sec)

ERROR:
No query specified

mysql>
```

Выйдем из среды mysql назад в терминал ОСи

```sql
mysql> exit
Bye
```

Посмотрим прослушку портов и убедимся, что **mysql** успешно слушает порт **3306**, так она настроена по дефолту.

```bash
lex@gblex:/home/lex$ ss -tulpan
Netid State Recv-Q Send-Q Local Address:Port Peer Address:Port Process
udp UNCONN 0 0 127.0.0.53%lo:53 0.0.0.0:_
udp UNCONN 0 0 192.168.1.100%ens160:68 0.0.0.0:_
udp UNCONN 0 0 [fe80::20c:29ff:fe91:9cd3]%ens160:546 [::]:_
tcp LISTEN 0 151 127.0.0.1:3306 0.0.0.0:_
tcp LISTEN 0 511 0.0.0.0:80 0.0.0.0:_
tcp LISTEN 0 4096 127.0.0.53%lo:53 0.0.0.0:_
tcp LISTEN 0 128 0.0.0.0:22 0.0.0.0:_
tcp LISTEN 0 70 127.0.0.1:33060 0.0.0.0:_
tcp ESTAB 0 0 192.168.1.100:22 192.168.1.93:58054
tcp LISTEN 0 511 _:8080 _:_
tcp LISTEN 0 511 [::]:80 [::]:_
tcp LISTEN 0 128 [::]:22 [::]:\*
lex@gblex:/home/lex$
```

Посмотрим список процессов и убедимся, что процесс **mysql** работает

```bash
lex@gblex:/home/lex$ ps afx
PID TTY STAT TIME COMMAND
2 ? S 0:00 [kthreadd]
3 ? I< 0:00 \_ [rcu_gp]
4 ? I< 0:00 \_ [rcu_par_gp]
5 ? I< 0:00 \_ [slub_flushwq]
6 ? I< 0:00 \_ [netns]
...
28471 ? Ssl 0:14 /usr/sbin/mysqld
lex@gblex:/home/lex$
```
