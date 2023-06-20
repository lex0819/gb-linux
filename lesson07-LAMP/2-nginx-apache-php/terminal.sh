lex@gblex:~$ sudo apt install apache2
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
apache2 is already the newest version (2.4.52-1ubuntu4.5).
apache2 set to manually installed.
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
lex@gblex:~$
lex@gblex:~$
lex@gblex:~$
lex@gblex:~$ sudo apt install libapache2-mod-php8.1
[sudo] password for lex:
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
libapache2-mod-php8.1 is already the newest version (8.1.2-1ubuntu2.11).
libapache2-mod-php8.1 set to manually installed.
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
lex@gblex:~$
lex@gblex:~$
lex@gblex:~$
lex@gblex:~$ sudo apachectl -t
AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 127.0.1.1. Set the 'ServerName' directive globally to suppress this message
Syntax OK
lex@gblex:~$
lex@gblex:~$
lex@gblex:~$ cd /etc/apache2/
lex@gblex:/etc/apache2$
lex@gblex:/etc/apache2$
lex@gblex:/etc/apache2$ ls -l
total 80
-rw-r--r-- 1 root root  7224 Mar  1 22:43 apache2.conf
drwxr-xr-x 2 root root  4096 Jun 20 05:41 conf-available
drwxr-xr-x 2 root root  4096 Jun 20 05:38 conf-enabled
-rw-r--r-- 1 root root  1782 Mar  1 22:43 envvars
-rw-r--r-- 1 root root 31063 Mar  1 22:43 magic
drwxr-xr-x 2 root root 12288 Jun 20 05:38 mods-available
drwxr-xr-x 2 root root  4096 Jun 20 05:38 mods-enabled
-rw-r--r-- 1 root root   320 Mar  1 22:43 ports.conf
drwxr-xr-x 2 root root  4096 Jun 20 05:38 sites-available
drwxr-xr-x 2 root root  4096 Jun 20 05:38 sites-enabled
lex@gblex:/etc/apache2$
lex@gblex:/etc/apache2$
lex@gblex:/etc/apache2$ cat apache2.conf
# This is the main Apache server configuration file.  It contains the
# configuration directives that give the server its instructions.
# See http://httpd.apache.org/docs/2.4/ for detailed information about
# the directives and /usr/share/doc/apache2/README.Debian about Debian specific
# hints.
#
#
# Summary of how the Apache 2 configuration works in Debian:
# The Apache 2 web server configuration in Debian is quite different to
# upstream's suggested way to configure the web server. This is because Debian's
# default Apache2 installation attempts to make adding and removing modules,
# virtual hosts, and extra configuration directives as flexible as possible, in
# order to make automating the changes and administering the server as easy as
# possible.

# It is split into several files forming the configuration hierarchy outlined
# below, all located in the /etc/apache2/ directory:
#
#	/etc/apache2/
#	|-- apache2.conf
#	|	`--  ports.conf
#	|-- mods-enabled
#	|	|-- *.load
#	|	`-- *.conf
#	|-- conf-enabled
#	|	`-- *.conf
# 	`-- sites-enabled
#	 	`-- *.conf
#
#
# * apache2.conf is the main configuration file (this file). It puts the pieces
#   together by including all remaining configuration files when starting up the
#   web server.
#
# * ports.conf is always included from the main configuration file. It is
#   supposed to determine listening ports for incoming connections which can be
#   customized anytime.
#
# * Configuration files in the mods-enabled/, conf-enabled/ and sites-enabled/
#   directories contain particular configuration snippets which manage modules,
#   global configuration fragments, or virtual host configurations,
#   respectively.
#
#   They are activated by symlinking available configuration files from their
#   respective *-available/ counterparts. These should be managed by using our
#   helpers a2enmod/a2dismod, a2ensite/a2dissite and a2enconf/a2disconf. See
#   their respective man pages for detailed information.
#
# * The binary is called apache2. Due to the use of environment variables, in
#   the default configuration, apache2 needs to be started/stopped with
#   /etc/init.d/apache2 or apache2ctl. Calling /usr/bin/apache2 directly will not
#   work with the default configuration.


# Global configuration
#

#
# ServerRoot: The top of the directory tree under which the server's
# configuration, error, and log files are kept.
#
# NOTE!  If you intend to place this on an NFS (or otherwise network)
# mounted filesystem then please read the Mutex documentation (available
# at <URL:http://httpd.apache.org/docs/2.4/mod/core.html#mutex>);
# you will save yourself a lot of trouble.
#
# Do NOT add a slash at the end of the directory path.
#
#ServerRoot "/etc/apache2"

#
# The accept serialization lock file MUST BE STORED ON A LOCAL DISK.
#
#Mutex file:${APACHE_LOCK_DIR} default

#
# The directory where shm and other runtime files will be stored.
#

DefaultRuntimeDir ${APACHE_RUN_DIR}

#
# PidFile: The file in which the server should record its process
# identification number when it starts.
# This needs to be set in /etc/apache2/envvars
#
PidFile ${APACHE_PID_FILE}

#
# Timeout: The number of seconds before receives and sends time out.
#
Timeout 300

#
# KeepAlive: Whether or not to allow persistent connections (more than
# one request per connection). Set to "Off" to deactivate.
#
KeepAlive On

#
# MaxKeepAliveRequests: The maximum number of requests to allow
# during a persistent connection. Set to 0 to allow an unlimited amount.
# We recommend you leave this number high, for maximum performance.
#
MaxKeepAliveRequests 100

#
# KeepAliveTimeout: Number of seconds to wait for the next request from the
# same client on the same connection.
#
KeepAliveTimeout 5


# These need to be set in /etc/apache2/envvars
User ${APACHE_RUN_USER}
Group ${APACHE_RUN_GROUP}

#
# HostnameLookups: Log the names of clients or just their IP addresses
# e.g., www.apache.org (on) or 204.62.129.132 (off).
# The default is off because it'd be overall better for the net if people
# had to knowingly turn this feature on, since enabling it means that
# each client request will result in AT LEAST one lookup request to the
# nameserver.
#
HostnameLookups Off

# ErrorLog: The location of the error log file.
# If you do not specify an ErrorLog directive within a <VirtualHost>
# container, error messages relating to that virtual host will be
# logged here.  If you *do* define an error logfile for a <VirtualHost>
# container, that host's errors will be logged there and not here.
#
ErrorLog ${APACHE_LOG_DIR}/error.log

#
# LogLevel: Control the severity of messages logged to the error_log.
# Available values: trace8, ..., trace1, debug, info, notice, warn,
# error, crit, alert, emerg.
# It is also possible to configure the log level for particular modules, e.g.
# "LogLevel info ssl:warn"
#
LogLevel warn

# Include module configuration:
IncludeOptional mods-enabled/*.load
IncludeOptional mods-enabled/*.conf

# Include list of ports to listen on
Include ports.conf


# Sets the default security model of the Apache2 HTTPD server. It does
# not allow access to the root filesystem outside of /usr/share and /var/www.
# The former is used by web applications packaged in Debian,
# the latter may be used for local directories served by the web server. If
# your system is serving content from a sub-directory in /srv you must allow
# access here, or in any related virtual host.
<Directory />
	Options FollowSymLinks
	AllowOverride None
	Require all denied
</Directory>

<Directory /usr/share>
	AllowOverride None
	Require all granted
</Directory>

<Directory /var/www/>
	Options Indexes FollowSymLinks
	AllowOverride None
	Require all granted
</Directory>

#<Directory /srv/>
#	Options Indexes FollowSymLinks
#	AllowOverride None
#	Require all granted
#</Directory>




# AccessFileName: The name of the file to look for in each directory
# for additional configuration directives.  See also the AllowOverride
# directive.
#
AccessFileName .htaccess

#
# The following lines prevent .htaccess and .htpasswd files from being
# viewed by Web clients.
#
<FilesMatch "^\.ht">
	Require all denied
</FilesMatch>


#
# The following directives define some format nicknames for use with
# a CustomLog directive.
#
# These deviate from the Common Log Format definitions in that they use %O
# (the actual bytes sent including headers) instead of %b (the size of the
# requested file), because the latter makes it impossible to detect partial
# requests.
#
# Note that the use of %{X-Forwarded-For}i instead of %h is not recommended.
# Use mod_remoteip instead.
#
LogFormat "%v:%p %h %l %u %t \"%r\" %>s %O \"%{Referer}i\" \"%{User-Agent}i\"" vhost_combined
LogFormat "%h %l %u %t \"%r\" %>s %O \"%{Referer}i\" \"%{User-Agent}i\"" combined
LogFormat "%h %l %u %t \"%r\" %>s %O" common
LogFormat "%{Referer}i -> %U" referer
LogFormat "%{User-agent}i" agent

# Include of directories ignores editors' and dpkg's backup files,
# see README.Debian for details.

# Include generic snippets of statements
IncludeOptional conf-enabled/*.conf

# Include the virtual host configurations:
IncludeOptional sites-enabled/*.conf

# vim: syntax=apache ts=4 sw=4 sts=4 sr noet
lex@gblex:/etc/apache2$
lex@gblex:/etc/apache2$
lex@gblex:/etc/apache2$
lex@gblex:/etc/apache2$ cat ports.conf
# If you just change the port or add more ports here, you will likely also
# have to change the VirtualHost statement in
# /etc/apache2/sites-enabled/000-default.conf

Listen 80

<IfModule ssl_module>
	Listen 443
</IfModule>

<IfModule mod_gnutls.c>
	Listen 443
</IfModule>

# vim: syntax=apache ts=4 sw=4 sts=4 sr noet
lex@gblex:/etc/apache2$
lex@gblex:/etc/apache2$
lex@gblex:/etc/apache2$
lex@gblex:/etc/apache2$ sudo nano ports.conf
lex@gblex:/etc/apache2$
lex@gblex:/etc/apache2$
lex@gblex:/etc/apache2$ cat ports.conf
# If you just change the port or add more ports here, you will likely also
# have to change the VirtualHost statement in
# /etc/apache2/sites-enabled/000-default.conf

Listen 8080

<IfModule ssl_module>
	Listen 443
</IfModule>

<IfModule mod_gnutls.c>
	Listen 443
</IfModule>

# vim: syntax=apache ts=4 sw=4 sts=4 sr noet
lex@gblex:/etc/apache2$
lex@gblex:/etc/apache2$
lex@gblex:/etc/apache2$
lex@gblex:/etc/apache2$ systemctl stop apache2
==== AUTHENTICATING FOR org.freedesktop.systemd1.manage-units ===
Authentication is required to stop 'apache2.service'.
Authenticating as: lex
Password:
==== AUTHENTICATION COMPLETE ===
lex@gblex:/etc/apache2$
lex@gblex:/etc/apache2$
lex@gblex:/etc/apache2$
lex@gblex:/etc/apache2$ systemctl start apache2
==== AUTHENTICATING FOR org.freedesktop.systemd1.manage-units ===
Authentication is required to start 'apache2.service'.
Authenticating as: lex
Password:
==== AUTHENTICATION COMPLETE ===
lex@gblex:/etc/apache2$
lex@gblex:/etc/apache2$
lex@gblex:/etc/apache2$
lex@gblex:/etc/apache2$ systemctl status apache2
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

Jun 20 09:16:33 gblex systemd[1]: Starting The Apache HTTP Server...
Jun 20 09:16:33 gblex apachectl[26108]: AH00558: apache2: Could not reliably determine the server's fully qualifie
d domain name, using 127.0.1.1. Set the 'ServerName' directive globally to suppress this message
Jun 20 09:16:33 gblex systemd[1]: Started The Apache HTTP Server.
lex@gblex:/etc/apache2$
lex@gblex:/etc/apache2$
lex@gblex:/etc/apache2$
lex@gblex:/etc/nginx$
lex@gblex:/etc/nginx$ systemctl reload ngnix
==== AUTHENTICATING FOR org.freedesktop.systemd1.manage-units ===
Authentication is required to reload 'ngnix.service'.
Authenticating as: lex
Password:
==== AUTHENTICATION COMPLETE ===
Failed to reload ngnix.service: Unit ngnix.service not found.
lex@gblex:/etc/nginx$
lex@gblex:/etc/nginx$
lex@gblex:/etc/nginx$
lex@gblex:/etc/nginx$ systemctl reload nginx
==== AUTHENTICATING FOR org.freedesktop.systemd1.manage-units ===
Authentication is required to reload 'nginx.service'.
Authenticating as: lex
Password:
==== AUTHENTICATION COMPLETE ===
lex@gblex:/etc/nginx$
lex@gblex:/etc/nginx$
lex@gblex:/etc/nginx$
lex@gblex:/etc/nginx$
lex@gblex:/etc/nginx$ ps afx
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
lex@gblex:/etc/nginx$
lex@gblex:/etc/nginx$
lex@gblex:/etc/nginx$
lex@gblex:/etc/nginx$ ss -tlpn
State        Recv-Q       Send-Q             Local Address:Port             Peer Address:Port       Process
LISTEN       0            511                      0.0.0.0:80                    0.0.0.0:*
LISTEN       0            4096               127.0.0.53%lo:53                    0.0.0.0:*
LISTEN       0            128                      0.0.0.0:22                    0.0.0.0:*
LISTEN       0            511                            *:8080                        *:*
LISTEN       0            511                         [::]:80                       [::]:*
LISTEN       0            128                         [::]:22                       [::]:*
lex@gblex:/etc/nginx$
lex@gblex:/etc/nginx$
lex@gblex:/etc/nginx$ ss -tulpan
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
lex@gblex:/etc/nginx$
lex@gblex:/etc/nginx$
lex@gblex:/etc/nginx$
lex@gblex:/etc/apache2/sites-available$ sudo nano 000-default.conf
[sudo] password for lex:
lex@gblex:/etc/apache2/sites-available$
lex@gblex:/etc/apache2/sites-available$
lex@gblex:/etc/apache2/sites-available$ cat 000-default.conf
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
lex@gblex:/etc/apache2/sites-available$
lex@gblex:/etc/apache2/sites-available$
lex@gblex:/etc/apache2/sites-available$ sudo systemctl reload apache2
lex@gblex:/etc/apache2/sites-available$
lex@gblex:/etc/apache2/sites-available$
lex@gblex:/etc/apache2/sites-available$
lex@gblex:/etc/apache2/sites-available$ apache2 -t
[Tue Jun 20 10:54:40.555363 2023] [core:warn] [pid 26399] AH00111: Config variable ${APACHE_RUN_DIR} is not defined
apache2: Syntax error on line 80 of /etc/apache2/apache2.conf: DefaultRuntimeDir must be a valid directory, absolute or relative to ServerRoot
lex@gblex:/etc/apache2/sites-available$
lex@gblex:/etc/apache2/sites-available$
lex@gblex:/etc/apache2$
lex@gblex:/etc/apache2$ source /etc/apache2/envvars
lex@gblex:/etc/apache2$
lex@gblex:/etc/apache2$
lex@gblex:/etc/apache2$ apache2 -V
Server version: Apache/2.4.52 (Ubuntu)
Server built:   2023-03-01T22:43:55
Server's Module Magic Number: 20120211:121
Server loaded:  APR 1.7.0, APR-UTIL 1.6.1
Compiled using: APR 1.7.0, APR-UTIL 1.6.1
Architecture:   64-bit
Server MPM:     prefork
  threaded:     no
    forked:     yes (variable process count)
Server compiled with....
 -D APR_HAS_SENDFILE
 -D APR_HAS_MMAP
 -D APR_HAVE_IPV6 (IPv4-mapped addresses enabled)
 -D APR_USE_PROC_PTHREAD_SERIALIZE
 -D APR_USE_PTHREAD_SERIALIZE
 -D SINGLE_LISTEN_UNSERIALIZED_ACCEPT
 -D APR_HAS_OTHER_CHILD
 -D AP_HAVE_RELIABLE_PIPED_LOGS
 -D DYNAMIC_MODULE_LIMIT=256
 -D HTTPD_ROOT="/etc/apache2"
 -D SUEXEC_BIN="/usr/lib/apache2/suexec"
 -D DEFAULT_PIDLOG="/var/run/apache2.pid"
 -D DEFAULT_SCOREBOARD="logs/apache_runtime_status"
 -D DEFAULT_ERRORLOG="logs/error_log"
 -D AP_TYPES_CONFIG_FILE="mime.types"
 -D SERVER_CONFIG_FILE="apache2.conf"
lex@gblex:/etc/apache2$
lex@gblex:/etc/apache2$
lex@gblex:/etc/apache2$ service apache2 restart
==== AUTHENTICATING FOR org.freedesktop.systemd1.manage-units ===
Authentication is required to restart 'apache2.service'.
Authenticating as: lex
Password:
==== AUTHENTICATION COMPLETE ===
lex@gblex:/etc/apache2$
lex@gblex:/etc/apache2$
lex@gblex:/etc/apache2$
lex@gblex:/etc/apache2$ apache2 -t
AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 127.0.1.1. Set the 'ServerName' directive globally to suppress this message
Syntax OK
lex@gblex:/etc/apache2$
lex@gblex:/etc/apache2$
lex@gblex:/etc/apache2$
lex@gblex:/etc/apache2$ cd /var/www/html/
lex@gblex:/var/www/html$ ls -l
total 20
-rw-r--r-- 1 root root 10671 Jun 20 05:38 index.html
-rw-r--r-- 1 root root   612 Jun 20 04:28 index.nginx-debian.html
drwxr-xr-x 2 root root  4096 Jun 20 07:48 php-fpm.test
lex@gblex:/var/www/html$
lex@gblex:/var/www/html$
lex@gblex:/var/www/html$ cat index.html
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
  <body>
  </body>
</html>
lex@gblex:/var/www/html$
lex@gblex:/var/www/html$
lex@gblex:/var/www/html$
