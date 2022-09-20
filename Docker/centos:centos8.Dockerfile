# centos:latest is Centos Linux 8 AppStream, so use centos8 to be specific
# Fix for missing mirrors: https://stackoverflow.com/questions/72741508/failed-to-download-metadata-for-repo-appstream
FROM centos:centos8
LABEL DERIVEDFROM="Red Hat Enterprise Linux 8.5"
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* && \
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-* && \
    dnf makecache && \
    dnf --assumeyes install epel-release && \
    dnf makecache && \
    dnf --assumeyes distribution-synchronization && \
    dnf --assumeyes install git make python3 python3-dnf tree vim-enhanced && \
    ln --force --symbolic /usr/bin/python3 /usr/bin/python && \
    pip3 --quiet install packaging setuptools-rust

WORKDIR /root/source
RUN git clone https://github.com/ansible/ansible.git
WORKDIR /root/source/ansible
RUN git checkout -b stable-2.9 origin/stable-2.9
RUN make install

# WORKDIR /root/source/mythtv-ansible
# Be sure .dockerignore is up to date as this copies all of ..
# COPY . ./
# RUN ./mythtv.yml --limit=localhost

WORKDIR /root/source
RUN git clone https://github.com/MythTV/mythtv.git
WORKDIR /root/source/mythtv/mythtv
RUN git checkout fixes/32

RUN ./configure \
    --enable-libx264 \
    --enable-libmp3lame \
    --enable-nonfree \
    --enable-proc-opt
# ADJUST THE NEXT LINE. Don't use $(nproc)
RUN make --jobs=4
RUN make install

WORKDIR /root/source/mythtv/mythplugins
RUN ./configure
# ADJUST THE NEXT LINE. Don't use $(nproc)
RUN make --jobs=4
RUN make install
