#!/usr/bin/retext --preview

## Ansible Playbook for MythTV
This repository contains the ansible playbook for setting up MythTV buildslaves.
It can also be used to install all the necessary packages if
you wish to build MythTV from source.

First you need to clone the playbooks:
```
git clone https://github.com/MythTV/ansible
```
Debian users running Wheezy will need to enable [wheezy-backports](https://wiki.debian.org/Backports)
Jessie or later is recommended for 0.28 and above.

Install an ssh client and server for your distribution. You must be able to ssh
into localhost from localhost.

### Install the ansible package
Choose the appropriate command(s) for your distro.
<br>

Distribution | Command
:-------|:--------
Archlinux | pacman -S ansible python2
Centos | yum install ansible (enable the [EPEL](https://fedoraproject.org/wiki/EPEL) repository first)
Debian (and derivatives) | apt install ansible
Fedora | dnf install ansible
MacOSX | port -v selfupdate; port upgrade outdated; port install py38-ansible
FreeBSD | pkg install py27-ansible
OpenSuse | zypper install ansible

ansible_core (as opposed to ansible) will require collections. They
are defined in the included requirements.yml file. See it for how to
load them.

### Running the playbooks
For most distributions, run the playbook as follows. Replace
`localhost` with the `--limit value` in the table below as
required:
```
./mythtv.yml --inventory=hosts.yml --limit=localhost
```
Distribution | --limit value
:-----------|:----------------
Archlinux | archlinux
Fedora 30 | f30
MacOSX | macports
FreeBSD | freebsd
Builders | builder
CPP Check and Doxygen | tools

MacOSX Users (replace python3.9 with the currently available of Python):
```
sudo port -v selfupdate
sudo port upgrade outdated
sudo port install py38-ansible
ansible-playbook-3.9 --extra-vars=ansible_python_interpreter=/opt/local/bin/python3.9 qt5.yml
```

MacOSX Users (optionally specify a databse version as follows):
```
ansible-playbook-3.9 --extra-vars="ansible_python_interpreter=/opt/local/bin/python3.9 database_version=mariadb-10.5"  qt5.yml
```

MacOSX Users (optionally do not install qtwebkit as follows):
```
ansible-playbook-3.9 --extra-vars="ansible_python_interpreter=/opt/local/bin/python3.9 install_qtwebkit=false"  qt5.yml
```
No need to run as root as `ansible_become` is `True` (assumes `sudo` works for the
user running the playbook.)

### Other Platforms
We welcome contributions to support additional platforms. Please contact the developers if you are interested in this. Output from the following is needed to start.
Note that older versions of Ansible will only work with one of the three items at a time (run it three times).
```
ansible --inventory=hosts.yml --module-name=setup --args="filter=ansible_distribution,ansible_distribution_major_version,ansible_pkg_mgr" localhost
```
