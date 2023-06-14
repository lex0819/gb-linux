lex@lexgb:/etc/apt/sources.list.d$ python3 --version
Python 3.10.6
lex@lexgb:/etc/apt/sources.list.d$


lex@lexgb:/etc/apt/sources.list.d$ ls -l
total 4
-rw-r--r-- 1 root root 112 Jun 14 08:55 docker.list
lex@lexgb:/etc/apt/sources.list.d$


lex@lexgb:/etc/apt/sources.list.d$ sudo apt install software-properties-common -y
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
software-properties-common is already the newest version (0.99.22.7).
software-properties-common set to manually installed.
0 upgraded, 0 newly installed, 0 to remove and 1 not upgraded.
lex@lexgb:/etc/apt/sources.list.d$



lex@lexgb:/etc/apt/sources.list.d$ sudo add-apt-repository ppa:deadsnakes/ppa -y
Repository: 'deb https://ppa.launchpadcontent.net/deadsnakes/ppa/ubuntu/ jammy main'
Description:
This PPA contains more recent Python versions packaged for Ubuntu.

Disclaimer: there's no guarantee of timely updates in case of security problems or other issues. If you want to use them in a security-or-otherwise-critical environment (say, on a production server), you do so at your own risk.

Update Note
===========
Please use this repository instead of ppa:fkrull/deadsnakes.

Reporting Issues
================

Issues can be reported in the master issue tracker at:
https://github.com/deadsnakes/issues/issues

Supported Ubuntu and Python Versions
====================================

- Ubuntu 20.04 (focal) Python3.5 - Python3.7, Python3.9 - Python3.11
- Ubuntu 22.04 (jammy) Python3.7 - Python3.9, Python3.11
- Note: Python2.7 (all), Python 3.8 (focal), Python 3.10 (jammy) are not provided by deadsnakes as upstream ubuntu provides those packages.

Why some packages aren't built:
- Note: for focal, older python versions require libssl<1.1 so they are not currently built
- Note: for jammy, older python versions requre libssl<3 so they are not currently built
- If you need these, reach out to asottile to set up a private ppa

The packages may also work on other versions of Ubuntu or Debian, but that is not tested or supported.

Packages
========

The packages provided here are loosely based on the debian upstream packages with some modifications to make them more usable as non-default pythons and on ubuntu.  As such, the packages follow debian's patterns and often do not include a full python distribution with just `apt install python#.#`.  Here is a list of packages that may be useful along with the default install:

- `python#.#-dev`: includes development headers for building C extensions
- `python#.#-venv`: provides the standard library `venv` module
- `python#.#-distutils`: provides the standard library `distutils` module
- `python#.#-lib2to3`: provides the `2to3-#.#` utility as well as the standard library `lib2to3` module
- `python#.#-gdbm`: provides the standard library `dbm.gnu` module
- `python#.#-tk`: provides the standard library `tkinter` module

Third-Party Python Modules
==========================

Python modules in the official Ubuntu repositories are packaged to work with the Python interpreters from the official repositories. Accordingly, they generally won't work with the Python interpreters from this PPA. As an exception, pure-Python modules for Python 3 will work, but any compiled extension modules won't.

To install 3rd-party Python modules, you should use the common Python packaging tools.  For an introduction into the Python packaging ecosystem and its tools, refer to the Python Packaging User Guide:
https://packaging.python.org/installing/

Sources
=======
The package sources are available at:
https://github.com/deadsnakes/

Nightly Builds
==============

For nightly builds, see ppa:deadsnakes/nightly https://launchpad.net/~deadsnakes/+archive/ubuntu/nightly
More info: https://launchpad.net/~deadsnakes/+archive/ubuntu/ppa
Adding repository.
Adding deb entry to /etc/apt/sources.list.d/deadsnakes-ubuntu-ppa-jammy.list
Adding disabled deb-src entry to /etc/apt/sources.list.d/deadsnakes-ubuntu-ppa-jammy.list
Adding key to /etc/apt/trusted.gpg.d/deadsnakes-ubuntu-ppa.gpg with fingerprint F23C5A6CF475977595C89F51BA6932366A755776
Hit:1 http://ports.ubuntu.com/ubuntu-ports jammy InRelease
Get:2 http://ports.ubuntu.com/ubuntu-ports jammy-updates InRelease [119 kB]
Hit:3 https://download.docker.com/linux/ubuntu jammy InRelease
Get:4 http://ports.ubuntu.com/ubuntu-ports jammy-backports InRelease [108 kB]
Get:5 http://ports.ubuntu.com/ubuntu-ports jammy-security InRelease [110 kB]
Get:6 https://ppa.launchpadcontent.net/deadsnakes/ppa/ubuntu jammy InRelease [18.1 kB]
Get:7 https://ppa.launchpadcontent.net/deadsnakes/ppa/ubuntu jammy/main arm64 Packages [18.4 kB]
Get:8 https://ppa.launchpadcontent.net/deadsnakes/ppa/ubuntu jammy/main Translation-en [4192 B]
Fetched 377 kB in 1s (278 kB/s)
Reading package lists... Done
lex@lexgb:/etc/apt/sources.list.d$



lex@lexgb:/etc/apt/sources.list.d$ sudo apt update
Hit:1 http://ports.ubuntu.com/ubuntu-ports jammy InRelease
Hit:2 http://ports.ubuntu.com/ubuntu-ports jammy-updates InRelease
Hit:3 https://download.docker.com/linux/ubuntu jammy InRelease
Hit:4 http://ports.ubuntu.com/ubuntu-ports jammy-backports InRelease
Hit:5 https://ppa.launchpadcontent.net/deadsnakes/ppa/ubuntu jammy InRelease
Hit:6 http://ports.ubuntu.com/ubuntu-ports jammy-security InRelease
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
1 package can be upgraded. Run 'apt list --upgradable' to see it.
lex@lexgb:/etc/apt/sources.list.d$



lex@lexgb:/etc/apt/sources.list.d$ apt list --upgradable
Listing... Done
ubuntu-drivers-common/jammy-updates 1:0.9.6.2~0.22.04.3 arm64 [upgradable from: 1:0.9.6.1]
N: There is 1 additional version. Please use the '-a' switch to see it
lex@lexgb:/etc/apt/sources.list.d$



lex@lexgb:/etc/apt/sources.list.d$ sudo apt install python3.7
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following additional packages will be installed:
  libpython3.7-minimal libpython3.7-stdlib python3.7-minimal
Suggested packages:
  python3.7-venv binfmt-support
The following NEW packages will be installed:
  libpython3.7-minimal libpython3.7-stdlib python3.7 python3.7-minimal
0 upgraded, 4 newly installed, 0 to remove and 1 not upgraded.
Need to get 4738 kB of archives.
After this operation, 17.4 MB of additional disk space will be used.
Do you want to continue? [Y/n] y
Get:1 https://ppa.launchpadcontent.net/deadsnakes/ppa/ubuntu jammy/main arm64 libpython3.7-minimal arm64 3.7.17-1+jammy1 [608 kB]
Get:2 https://ppa.launchpadcontent.net/deadsnakes/ppa/ubuntu jammy/main arm64 python3.7-minimal arm64 3.7.17-1+jammy1 [1888 kB]
Get:3 https://ppa.launchpadcontent.net/deadsnakes/ppa/ubuntu jammy/main arm64 libpython3.7-stdlib arm64 3.7.17-1+jammy1 [1880 kB]
Get:4 https://ppa.launchpadcontent.net/deadsnakes/ppa/ubuntu jammy/main arm64 python3.7 arm64 3.7.17-1+jammy1 [362 kB]
Fetched 4738 kB in 2s (1977 kB/s)
Selecting previously unselected package libpython3.7-minimal:arm64.
(Reading database ... 115708 files and directories currently installed.)
Preparing to unpack .../libpython3.7-minimal_3.7.17-1+jammy1_arm64.deb ...
Unpacking libpython3.7-minimal:arm64 (3.7.17-1+jammy1) ...
Selecting previously unselected package python3.7-minimal.
Preparing to unpack .../python3.7-minimal_3.7.17-1+jammy1_arm64.deb ...
Unpacking python3.7-minimal (3.7.17-1+jammy1) ...
Selecting previously unselected package libpython3.7-stdlib:arm64.
Preparing to unpack .../libpython3.7-stdlib_3.7.17-1+jammy1_arm64.deb ...
Unpacking libpython3.7-stdlib:arm64 (3.7.17-1+jammy1) ...
Selecting previously unselected package python3.7.
Preparing to unpack .../python3.7_3.7.17-1+jammy1_arm64.deb ...
Unpacking python3.7 (3.7.17-1+jammy1) ...
Setting up libpython3.7-minimal:arm64 (3.7.17-1+jammy1) ...
Setting up python3.7-minimal (3.7.17-1+jammy1) ...
Setting up libpython3.7-stdlib:arm64 (3.7.17-1+jammy1) ...
Setting up python3.7 (3.7.17-1+jammy1) ...
Processing triggers for mailcap (3.70+nmu1ubuntu1) ...
Processing triggers for man-db (2.10.2-1) ...
Scanning processes...
Scanning linux images...

Running kernel seems to be up-to-date.

No services need to be restarted.

No containers need to be restarted.

No user sessions are running outdated binaries.

No VM guests are running outdated hypervisor (qemu) binaries on this host.
lex@lexgb:/etc/apt/sources.list.d$



lex@lexgb:/etc/apt/sources.list.d$ python3 --version
Python 3.10.6
lex@lexgb:/etc/apt/sources.list.d$ ls -la
total 16
drwxr-xr-x 2 root root 4096 Jun 14 09:23 .
drwxr-xr-x 8 root root 4096 Jun 14 08:37 ..
-rw-r--r-- 1 root root  148 Jun 14 09:23 deadsnakes-ubuntu-ppa-jammy.list
-rw-r--r-- 1 root root  112 Jun 14 09:23 docker.list
lex@lexgb:/etc/apt/sources.list.d$



lex@lexgb:/etc/apt/sources.list.d$ python --version
Command 'python' not found, did you mean:
  command 'python3' from deb python3
  command 'python' from deb python-is-python3
lex@lexgb:/etc/apt/sources.list.d$



lex@lexgb:/etc/apt/sources.list.d$ python3.7 --version
Python 3.7.17
lex@lexgb:/etc/apt/sources.list.d$



lex@lexgb:/etc/apt/sources.list.d$ sudo add-apt-repository --remove ppa:deadsnakes/ppa
[sudo] password for lex:
Repository: 'deb https://ppa.launchpadcontent.net/deadsnakes/ppa/ubuntu/ jammy main'
Description:
This PPA contains more recent Python versions packaged for Ubuntu.

Disclaimer: there's no guarantee of timely updates in case of security problems or other issues. If you want to use them in a security-or-otherwise-critical environment (say, on a production server), you do so at your own risk.

Update Note
===========
Please use this repository instead of ppa:fkrull/deadsnakes.

Reporting Issues
================

Issues can be reported in the master issue tracker at:
https://github.com/deadsnakes/issues/issues

Supported Ubuntu and Python Versions
====================================

- Ubuntu 20.04 (focal) Python3.5 - Python3.7, Python3.9 - Python3.11
- Ubuntu 22.04 (jammy) Python3.7 - Python3.9, Python3.11
- Note: Python2.7 (all), Python 3.8 (focal), Python 3.10 (jammy) are not provided by deadsnakes as upstream ubuntu provides those packages.

Why some packages aren't built:
- Note: for focal, older python versions require libssl<1.1 so they are not currently built
- Note: for jammy, older python versions requre libssl<3 so they are not currently built
- If you need these, reach out to asottile to set up a private ppa

The packages may also work on other versions of Ubuntu or Debian, but that is not tested or supported.

Packages
========

The packages provided here are loosely based on the debian upstream packages with some modifications to make them more usable as non-default pythons and on ubuntu.  As such, the packages follow debian's patterns and often do not include a full python distribution with just `apt install python#.#`.  Here is a list of packages that may be useful along with the default install:

- `python#.#-dev`: includes development headers for building C extensions
- `python#.#-venv`: provides the standard library `venv` module
- `python#.#-distutils`: provides the standard library `distutils` module
- `python#.#-lib2to3`: provides the `2to3-#.#` utility as well as the standard library `lib2to3` module
- `python#.#-gdbm`: provides the standard library `dbm.gnu` module
- `python#.#-tk`: provides the standard library `tkinter` module

Third-Party Python Modules
==========================

Python modules in the official Ubuntu repositories are packaged to work with the Python interpreters from the official repositories. Accordingly, they generally won't work with the Python interpreters from this PPA. As an exception, pure-Python modules for Python 3 will work, but any compiled extension modules won't.

To install 3rd-party Python modules, you should use the common Python packaging tools.  For an introduction into the Python packaging ecosystem and its tools, refer to the Python Packaging User Guide:
https://packaging.python.org/installing/

Sources
=======
The package sources are available at:
https://github.com/deadsnakes/

Nightly Builds
==============

For nightly builds, see ppa:deadsnakes/nightly https://launchpad.net/~deadsnakes/+archive/ubuntu/nightly
More info: https://launchpad.net/~deadsnakes/+archive/ubuntu/ppa
Removing repository.
Press [ENTER] to continue or Ctrl-c to cancel.
Disabling deb entry in /etc/apt/sources.list.d/deadsnakes-ubuntu-ppa-jammy.list
Removing disabled deb entry from /etc/apt/sources.list.d/deadsnakes-ubuntu-ppa-jammy.list
Removing disabled deb-src entry from /etc/apt/sources.list.d/deadsnakes-ubuntu-ppa-jammy.list
Hit:1 http://ports.ubuntu.com/ubuntu-ports jammy InRelease
Hit:2 https://download.docker.com/linux/ubuntu jammy InRelease
Get:3 http://ports.ubuntu.com/ubuntu-ports jammy-updates InRelease [119 kB]
Hit:4 http://ports.ubuntu.com/ubuntu-ports jammy-backports InRelease
Get:5 http://ports.ubuntu.com/ubuntu-ports jammy-security InRelease [110 kB]
Fetched 229 kB in 1s (388 kB/s)
Reading package lists... Done
lex@lexgb:/etc/apt/sources.list.d$


lex@lexgb:/etc/apt/sources.list.d$ ls -l
total 4
-rw-r--r-- 1 root root 112 Jun 14 09:42 docker.list
lex@lexgb:/etc/apt/sources.list.d$
