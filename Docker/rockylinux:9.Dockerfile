FROM rockylinux:9
LABEL CODENAME="Blue Onyx"
RUN dnf update --assumeyes && dnf install --assumeyes \
    dnf-plugins-core \
    epel-release \
    ansible-core \
    git \
    vim \
    && dnf distro-sync --assumeyes

WORKDIR /root/source/ansible
COPY . ./
RUN ansible-galaxy collection install --requirements-file=requirements.yml \
    && ./mythtv.yml --limit=localhost

WORKDIR /root/source
RUN git clone https://github.com/MythTV/mythtv.git

WORKDIR /root/source/mythtv
RUN git checkout fixes/35 && cmake --preset qt5 && cmake --build build-qt5
