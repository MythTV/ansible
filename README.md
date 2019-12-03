## Ansible Playbooks for MythTV
These are ansible playbooks for setting up MythTV buildslaves.
They can also be used to install all the necessary packages if
you wish to build MythTV from source.

First you need to clone the playbooks:
```
git clone https://github.com/MythTV/ansible
```

Debian users running Wheezy will need to enable [wheezy-backports](https://wiki.debian.org/Backports)
Jessie or later is recommended for 0.28 and above.

### Install the ansible package
Then install the `ansible` package. Choose the one appropriate
for your distro

* Centos users will need to enable the [EPEL](https://fedoraproject.org/wiki/EPEL) repository in order to be able to install ansible

Distro | Command
-------|--------
Archlinux |  pacman -S ansible python2 
Centos | yum install ansible
Debian (and derivatives) | apt-get install ansible
Fedora | dnf install ansible
FreeBSD | pkg install py27-ansible
OpenSuse |  zypper install ansible

### Run the playbooks
Then run the playbooks as follows.

Please note archlinux users will need to add `--limit archlinux` to these commands
Alternate hosts files are provided for archlinux, fedora 30 and freebsd users, as these
platforms have different python requirements. Please replace hosts, with the
appropriate filename.

For a normal development system:
```
ansible-playbook -i hosts qt5.yml
```

For a buildslave system:
```
ansible-playbook -i hosts buildslave.yml
```

### Other Platforms
We welcome contributions to support additional platforms. Please contact the developers if you are interested in this.
