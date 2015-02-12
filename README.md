These are ansible playbooks for setting up MythTV buildslaves.

Several Roles are defined
- mythtv-deb
  - Installs mandatory packages for deb based distros
- mythtv-rpm
  - Installs mandatory packages for rpm based distros
- buildslave
  - Installs packages to create a buildslave

How to use this
# git clone https://github.com/MythTV/ansible

Debian users will need to enable wheezy-backports
https://wiki.debian.org/Backports

Then install the `ansible` package
# yum install ansible
OR
# apt-get install ansible

Then run the playbooks as follows.
For a normal development system running Qt4
# ansible-playbook -i hosts qt4.yml

For a normal development system running Qt5
# ansible-playbook -i hosts qt5.yml

For a buildslave system running Qt4
# ansible-playbook -i hosts buildslave.yml

For a buildslave system running Qt5
# ansible-playbook -i hosts buildslave-qt5.yml

