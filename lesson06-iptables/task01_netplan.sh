lex@lexgb:~$ netplan --help
usage: /usr/sbin/netplan  [-h] [--debug]  ...

Network configuration in YAML

options:
  -h, --help  show this help message and exit
  --debug     Enable debug messages

Available commands:

    help      Show this help message
    apply     Apply current netplan config to running system
    generate  Generate backend specific configuration files from
              /etc/netplan/*.yaml
    get       Get a setting by specifying a nested key like
              "ethernets.eth0.addresses", or "all"
    info      Show available features
    ip        Retrieve IP information from the system
    set       Add new setting by specifying a dotted key=value pair like
              ethernets.eth0.dhcp4=true
    rebind    Rebind SR-IOV virtual functions of given physical functions to
              their driver
    try       Try to apply a new netplan config to running system, with
              automatic rollback
lex@lexgb:~$


lex@lexgb:~$ ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: ens160: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 00:0c:29:91:9c:d3 brd ff:ff:ff:ff:ff:ff
    altname enp2s0
    inet 172.16.8.128/24 metric 100 brd 172.16.8.255 scope global dynamic ens160
       valid_lft 1228sec preferred_lft 1228sec
    inet6 fe80::20c:29ff:fe91:9cd3/64 scope link
       valid_lft forever preferred_lft forever
lex@lexgb:~$


lex@lexgb:~$ netstat -r
Kernel IP routing table
Destination     Gateway         Genmask         Flags   MSS Window  irtt Iface
default         _gateway        0.0.0.0         UG        0 0          0 ens160
172.16.8.0      0.0.0.0         255.255.255.0   U         0 0          0 ens160
_gateway        0.0.0.0         255.255.255.255 UH        0 0          0 ens160
lex@lexgb:~$



lex@lexgb:~$ ls -l /etc/netplan
total 4
-rw-r--r-- 1 root root 117 May 29 09:37 00-installer-config.yaml
lex@lexgb:~$


lex@lexgb:~$ cat /etc/netplan/00-installer-config.yaml
# This is the network config written by 'subiquity'
network:
  ethernets:
    ens160:
      dhcp4: true
  version: 2
lex@lexgb:~$


lex@lexgb:~$ sudo cp /etc/netplan/00-installer-config.yaml /etc/netplan/gb-net-config.yaml
[sudo] password for lex:
lex@lexgb:~$ ls -l /etc/netplan
total 8
-rw-r--r-- 1 root root 117 May 29 09:37 00-installer-config.yaml
-rw-r--r-- 1 root root 117 Jun 16 06:49 gb-net-config.yaml
lex@lexgb:~$


lex@lexgb:~$ sudo nano /etc/netplan/gb-net-config.yaml
lex@lexgb:~$


lex@lexgb:~$ cat /etc/netplan/gb-net-config.yaml
# This is the network config written for GB linux course
network:
  version: 2
  ethernets:
    ens160:
      addresses: [172.16.8.128/24]
      routes:
        - to: 0.0.0.0/0
          via: 172.16.8.0
      nameservers:
        addresses: [1.1.1.1, 8.8.8.8]
      dhcp4: no
lex@lexgb:~$
