## Ansible Playbooks for MythTV
These are ansible playbooks for setting up MythTV buildslaves.
They can also be used to install all the necessary packages if
you wish to build MythTV from source.

How to use this
> git clone https://github.com/MythTV/ansible

Debian users running Wheezy will need to enable [wheezy-backports](https://wiki.debian.org/Backports)
Jessie or later is recommended for 0.28 and above.

### Install the ansible package
Then install the `ansible` package. Choose the one appropriate
for your distro
> yum install ansible

> dnf install ansible

> apt-get install ansible

> pacman -S ansible python2

> pkg install py27-ansible

> zypper install ansible

### Run the playbooks
Then run the playbooks as follows.

Please note archlinux users will need to add `--limit archlinux` to these commands
Alternate hosts files are provided for archlinux and freebsd users, as these
platforms have different python requirements. Please replace hosts, with the
appropriate filename.

For a normal development system running Qt5
> ansible-playbook -i hosts qt5.yml

For a buildslave system running Qt5
> ansible-playbook -i hosts buildslave-qt5.yml

#### Only for older releases
You will only need to use these instructions if you are trying
to build older releases of MythTV which are based on Qt4.

For a normal development system running Qt4
> ansible-playbook -i hosts qt4.yml

For a buildslave system running Qt4
> ansible-playbook -i hosts buildslave.yml

For a buildslave system running both Qt4 and Qt5
> ansible-playbook -i hosts buildslave.yml

### Other Platforms
We welcome contributions to support additional platforms. Please contact the developers if you are interested in this.
