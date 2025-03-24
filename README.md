#!/usr/bin/env -S retext --preview

[//]: # (Install retext from your distribution then ./README.md will look prettier.)

## Ansible Playbook for MythTV
** Only runs on Ansible versions above 2.3. **

N.B. 6/7/2023, the directory for Ansible collections has been corrected.
See requirements.yml and re-run if non Ansible core modules fail (most
won't need to do this.)

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
MacOSX (macports) | port install py-ansible
MacOSX (homebrew) | brew install ansible
FreeBSD | pkg install py27-ansible
OpenSuse | zypper install ansible

Most users will use `Ansible Community` from their distribution.
`Ansible Core` will require `collections`.  They are defined in
the included `requirements.yml` file. See it for how to load them.

### Running the playbook
For most distributions, run the playbook as follows. Replace
`localhost` with the `--limit value` in the table below if
required.
See `mythtv.yml` for an additional command line if this
doesn't work for your distribution:

``` ./mythtv.yml --limit=localhost ```
<br>

Distribution|--limit value
:-----------|:------------
Fedora 30 | f30 (36 went EOL on 2023/05/16)
MacOSX (using MacPorts)| macports
MacOSX (using MacPorts)| homebrew
FreeBSD | freebsd (was for python2.7 only)
Builders | builder
CPP Check and Doxygen | tools

### Qt6 Support
For Qt6 support, run the playbook like this:

``` ./mythtv.yml --limit=localhost --extra-vars='{"qt6":true}' ```


#### MacOSX Homebrew Users
``` brew install ansible ```<br>
``` ./mythtv.yml --limit=localhost ```

To disable the sudo / become prompt run add
``` ANSIBLE_BECOME=false ANSIBLE_BECOME_ASK_PASS=False ```
to the beginning of the command line (homebrew is already set to run
without escalating privileges in the homebrew playbook). E.g.

``` ANSIBLE_BECOME=false ANSIBLE_BECOME_ASK_PASS=False ./mythtv.yml --limit=localhost ```


#### MacOSX MacPorts Users
``` sudo port install py-ansible ```<br>
``` ./mythtv.yml --limit=localhost ```

- Optionally specify a database version:

    ``` ./mythtv.yml --extra-vars="database_version=mariadb-10.5" --limit=localhost ```

- Optionally do not install qtwebkit:

    ``` ./mythtv.yml --extra-vars="install_qtwebkit=false" --limit=localhost ```

- Optionally specify a different version of python3

   ``` ./mythtv.yml --extra-vars="ansible_python_interpreter=/opt/local/bin/python3.11"  --limit=localhost ```

## Other Platforms
We welcome contributions to support additional platforms. Please contact the
developers if you are interested in this. Output from a run of ```./mythtv.yml ...```
is needed for starters.
