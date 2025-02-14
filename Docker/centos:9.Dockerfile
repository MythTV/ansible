# A centos:9 manifest is unknown to hub.docker.com
# The package manager would probably be dnf too.
FROM centos:9
RUN dnf distribution-synchronization --assumeyes
RUN dnf install centos-release-ansible-29.noarch git tree vim-enhanced --assumeyes

WORKDIR /root/source/ansible
COPY . ./
RUN ./mythtv.yml --limit=localhost

WORKDIR /root/source
RUN git clone https://github.com/MythTV/mythtv.git

WORKDIR /root/source/mythtv
RUN git checkout fixes/35
RUN cmake --preset qt5
RUN cmake --build build-qt5
