# This actually has value because it tries to run Ansible on a distro
# that isn't known to the MythTV playbook. It will fail, but the info
# from common role is used for adding new distros.
FROM amazonlinux:devel
RUN dnf install --assumeyes file git less make python3-packaging python3-setuptools vim
RUN ln /usr/bin/python3 /usr/bin/python

WORKDIR /root/source
RUN git clone https://github.com/ansible/ansible.git
WORKDIR /root/source/ansible
RUN git checkout -b stable-2.13 origin/stable-2.13
RUN make install

WORKDIR /root/source/mythtv-ansible
COPY . ./
RUN ./mythtv.yml --limit=f30 || true
