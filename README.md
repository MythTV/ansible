#!/usr/bin/env -S retext --preview

[//]: # (Install retext from your distribution then ./README.md will look prettier.)

## Ansible Playbook for MythTV
** Only runs on Ansible versions above 2.3. **

This repository contains an Ansible playbook for user's that build MythTV
from source. It's also used for setting up MythTV buildslaves.

First you need to clone the playbook:

``` git clone https://github.com/MythTV/ansible ```

``` cd <the directory just created>```

Debian users running Wheezy will need to enable
[wheezy-backports](https://wiki.debian.org/Backports).
Jessie or later is recommended for 0.28 and above.

Install an `ssh` client and server for your distribution. You must be
able to `ssh` into `localhost` from `localhost`.

### Install the Ansible package
Choose the appropriate command(s) for your distribution.
<br>

Distribution | Command
:-------|:--------
Archlinux | pacman -S ansible
Centos | yum install ansible (enable the [EPEL](https://fedoraproject.org/wiki/EPEL) repository first)
Debian (and derivatives) | apt install ansible
Fedora | dnf install ansible
MacOSX | port -v selfupdate; port upgrade outdated; port install py38-ansible
FreeBSD | pkg install py27-ansible
OpenSuse | zypper install ansible

Most users will use `Ansible Community` from their distribution.
`Ansible Core` will require `collections`.  They are defined in
the included `requirements.yml` file. See it for how to load them.

### Running the playbook
For most distributions, run the playbook as follows. Replace
`localhost` with the `--limit value` in the table below.
See `mythtv.yml` for an additional command line if this
doesn't work for your distribution:

``` ./mythtv.yml --limit=localhost ```
<br>

Distribution|--limit value
:-----------|:------------
Archlinux | archlinux
Fedora 30 | f30
MacOSX (using MacPorts)| macports
FreeBSD | freebsd
Builders | builder
CPP Check and Doxygen | tools

#### MacOSX Users

sudo port -v selfupdate
sudo port upgrade outdated
sudo port install py310-ansible
./mythtv.yml --limit=localhost

*optionally specify a database version:

``` ./mythtv.yml --extra-vars="database_version=mariadb-10.5" --limit=localhost ```

*optionally do not install qtwebkit:

``` ./mythtv.yml --extra-vars="install_qtwebkit=false" --limit=localhost ```

## Other Platforms
We welcome contributions to support additional platforms. Please contact lhe
developers if you are interested in this. Output from the following is needed
to start.  Note that older versions of Ansible will only work with one filter
variable (run it once for each of the three items below).

``` ansible --inventory=hosts.yml --module-name=setup --args="filter=ansible_distribution,ansible_distribution_major_version,ansible_pkg_mgr" localhost ```
