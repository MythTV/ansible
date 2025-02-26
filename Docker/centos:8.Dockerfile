FROM quay.io/centos/centos:stream
LABEL DERIVEDFROM="RHEL 8 Public Upstream Development Branch"
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* \
    && sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-* \
    && dnf makecache \
    && dnf --assumeyes install epel-release \
    && dnf makecache \
    && dnf --assumeyes distribution-synchronization \
    && dnf --assumeyes install ansible git python3-dnf tree vim-enhanced \
    && ln --force --symbolic /usr/bin/python3 /usr/bin/python
    #&& pip3 --quiet install packaging setuptools-rust

WORKDIR /root/source/ansible
COPY . ./
RUN ./mythtv.yml --limit=localhost --extra-vars='{"venv_active":true}'

WORKDIR /root/source
RUN git clone https://github.com/MythTV/mythtv.git

#WORKDIR /root/source/mythtv
#RUN git checkout fixes/35 \
#    && cmake --preset qt5 \
#    && VIRTUAL_ENV=/usr/local/dist cmake --build build-qt5
