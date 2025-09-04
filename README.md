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

Debian users running Wheezy (v7, obsolete stable release) will need to enable
[wheezy-backports](https://wiki.debian.org/Backports).
Jessie or later is recommended for 0.28 and above.

Install an `ssh` client and server for your distribution. You must be
able to `ssh` into `localhost` from `localhost` without a password.

### Install the Ansible package
Choose the appropriate command(s) for your distribution.
<br>

Distribution | Command
:-------|:--------
Archlinux | pacman -S ansible
Centos | yum install ansible (enable the [EPEL](https://fedoraproject.org/wiki/EPEL) repository first)
Debian (and derivatives) | apt install ansible
Fedora | dnf install ansible
macOS (macports) | port install py-ansible
macOS (homebrew) | brew install ansible
FreeBSD | pkg install py311-ansible
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
macOS (using macports)| macports
macOS (using homebrew)| homebrew
FreeBSD | freebsd (was for python2.7 only)
Builders | builder
CPP Check and Doxygen | tools

### Python Virtual Environment
By default, the playbook will not create a virtual environment for the MythTV
Python modules. Virtual environments are the recommended solution for
non-system Python code. Use your favorite search engine to see
lots of discussions about using venvs. To create a venv and and print
instructions for building MythTV using it, use following:

```--extra-vars='{"venv_active":true}' ```
```--extra-vars='{"venv_path":"something other than ~/.virtualenvs/mythtv"}' ```

### Qt6 Support (non-macOS)
For Qt6 support, add this:

``` --extra-vars='{"qt6":true}' ```

### Qt5 Support (macOS)
Qt6 is the default for macOS on both macports and homebrew.  To enable Qt5 for
macports or homebrew, add this:

``` --extra-vars='{"qt5":true}' ```

#### macOS Homebrew Users
To disable the sudo / become prompt run add
``` ANSIBLE_BECOME=false ANSIBLE_BECOME_ASK_PASS=False ```
to the beginning of the command line (homebrew is already set to run
without escalating privileges in the homebrew playbook). E.g.

```ANSIBLE_BECOME=false ANSIBLE_BECOME_ASK_PASS=False ./mythtv.yml --limit=localhost ```


#### macOS MacPorts Users
By default macports uses mysql8 as the database. To specify a different database:

``` ./mythtv.yml --extra-vars="database_version=mariadb-10.5" --limit=localhost ```

To specify a custom version of python3:

``` ./mythtv.yml --extra-vars="ansible_python_interpreter=/opt/local/bin/python3.14"  --limit=localhost ```

### User Options
There is a README file under group_vars that explains how some of the options
used in this playbook can be set. Most users won't need to create the file
explained in the README.

### Other Platforms
We welcome contributions to support additional platforms. Please open an issue and/or
a pull request at
https://github.com/MythTV/ansible/issues if you are interested in this.
The output from a run of ```./mythtv.yml ...``` is needed for starters.
