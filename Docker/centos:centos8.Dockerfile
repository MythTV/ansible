# centos:latest is Centos Linux 8 AppStream, so use centos8 to be specific
# Fix for missing mirrors: https://stackoverflow.com/questions/72741508/failed-to-download-metadata-for-repo-appstream
# Couldn't get dnf to install Ansible, so added it from github.
FROM centos:centos8
LABEL CODENAME="N/A" DERIVEDFROM="Red Hat Enterprise Linux 8.5" EOL="2021-12-31"
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* && \
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-* && \
    dnf makecache && \
    dnf --assumeyes install epel-release && \
    dnf makecache && \
    dnf --assumeyes distribution-synchronization && \
    dnf --assumeyes install git make python39 tree vim-enhanced && \
    ln --force --symbolic /usr/bin/python3 /usr/bin/python && \
    pip3 --quiet install packaging setuptools-rust

WORKDIR /root/source
RUN git clone https://github.com/ansible/ansible.git
WORKDIR /root/source/ansible
RUN git checkout -b stable-2.9 origin/stable-2.9
RUN make install

WORKDIR /root/source/mythtv-ansible
# Be .dockerignore is up to date as this copies all of ..
COPY . ./
# Turned off because the playbook won't run due to a python3-dnf problem
# RUN ./mythtv.yml --limit=localhost
