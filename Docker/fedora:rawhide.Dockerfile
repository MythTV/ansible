FROM quay.io/fedora/fedora:rawhide
LABEL CODENAME="Rawhide"
RUN dnf5 install --assumeyes ansible git tree vim

WORKDIR /root/source/ansible
COPY . ./
RUN ./mythtv.yml --limit=localhost --extra-vars='{"venv_active":true}'

WORKDIR /root/source
RUN git clone https://github.com/MythTV/mythtv.git

WORKDIR /root/source/mythtv
RUN git checkout fixes/35 \
    && cmake --preset qt5 \
    && VIRTUAL_ENV=/usr/local/dist cmake --build build-qt5
