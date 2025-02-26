FROM quay.io/centos/centos:stream9
RUN dnf distribution-synchronization --assumeyes \
    && dnf install --assumeyes ansible-core git tree vim-enhanced

WORKDIR /root/source/ansible
COPY . ./
RUN ansible-galaxy collection install --requirements-file=requirements.yml \
    && ./mythtv.yml --limit=localhost --extra-vars='{"venv_active":true}'

WORKDIR /root/source
RUN git clone https://github.com/MythTV/mythtv.git

WORKDIR /root/source/mythtv
RUN git checkout fixes/35 \
    && cmake --preset qt5 \
    && VIRTUAL_ENV=/usr/local/dist cmake --build build-qt5
