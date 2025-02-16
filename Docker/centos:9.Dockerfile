# A centos:stream9 manifest is unknown to hub.docker.com
FROM quay.io/centos/centos:stream9
RUN dnf distribution-synchronization --assumeyes
RUN dnf install --assumeyes ansible-core git tree vim-enhanced

WORKDIR /root/source/ansible
COPY . ./
RUN ansible-galaxy collection install --requirements-file=requirements.yml
RUN ./mythtv.yml --limit=localhost

WORKDIR /root/source
RUN git clone https://github.com/MythTV/mythtv.git

WORKDIR /root/source/mythtv
RUN git checkout fixes/35
RUN cmake --preset qt5
RUN cmake --build build-qt5
