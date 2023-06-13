lex@gblex:~$ mkdir logs
lex@gblex:~$ ls -l
total 52
-rw-rw-r-- 1 lex  lex       1 июн 12 10:20 12.txt
drwxr-xr-x 2 lex  lex    4096 июн 11 23:13 Desktop
drwxr-xr-x 2 lex  lex    4096 июн 11 23:13 Documents
drwxr-xr-x 2 lex  lex    4096 июн 12 12:15 Downloads
drwxrwxr-x 2 lex  lex    4096 июн 13 19:12 logs


lex@gblex:~$ crontab -e
no crontab for lex - using an empty one

Select an editor.  To change later, run 'select-editor'.
  1. /bin/nano        <---- easiest
  2. /usr/bin/mcedit
  3. /usr/bin/vim.tiny
  4. /bin/ed

Choose 1-4 [1]: 1

*/3 * * * * w >> /home/lex/logs/w_log.log

crontab: installing new crontab
lex@gblex:~$


lex@gblex:~$ cd logs
lex@gblex:~/logs$ ls -l
total 4
-rw-rw-r-- 1 lex lex 630 июн 13 19:24 w_log.log
lex@gblex:~/logs$
lex@gblex:~/logs$ cat w_log.log
 19:21:01 up  3:29,  2 users,  load average: 0,00, 0,01, 0,02
USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT
lex      tty2     tty2             12:53   41:43   0.06s  0.05s /usr/libexec/gnome-session-binary --session=ubuntu
lex      pts/1    10.0.2.2         12:56    4.00s  0.38s  0.38s -bash
 19:24:01 up  3:32,  2 users,  load average: 0,11, 0,04, 0,02
USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT
lex      tty2     tty2             12:53   44:43   0.06s  0.05s /usr/libexec/gnome-session-binary --session=ubuntu
lex      pts/1    10.0.2.2         12:56   56.00s  0.39s  0.39s -bash
lex@gblex:~/logs$