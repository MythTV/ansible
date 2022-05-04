#!/usr/bin/retext --preview

## Note:
This release contains changes for the deprecated `include:` module. It only
runs on ansible versions above 2.4.

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
required. See mythtv.yml for additional command lines if this
doesn't work for a specific distribution:
```
./mythtv.yml --limit=localhost
```
Distribution | --limit value
:-----------|:----------------
Archlinux | archlinux
Fedora 30 | f30
MacOSX | macports
FreeBSD | freebsd
Builders | builder
CPP Check and Doxygen | tools

MacOSX Users:
```
sudo port -v selfupdate
sudo port upgrade outdated
sudo port install py38-ansible
./mythtv.yml --limit=localhost
```

MacOSX Users (optionally specify a database version as follows):
```
./mythtv.yml -extra-vars="database_version=mariadb-10.5" --limit=localhost
```

MacOSX Users (optionally do not install qtwebkit as follows):
```
./mythtv.yml --extra-vars="install_qtwebkit=false" --limit=localhost
```
No need to run as root as `ansible_become` is `True` (assumes `sudo` works for the
user running the playbook.)

### Other Platforms
We welcome contributions to support additional platforms. Please contact the developers if you are interested in this. Output from the following is needed to start.
Note that older versions of Ansible will only work with one of the three items at a time (run it three times).
```
ansible --inventory=hosts.yml --module-name=setup --args="filter=ansible_distribution,ansible_distribution_major_version,ansible_pkg_mgr" localhost
```
