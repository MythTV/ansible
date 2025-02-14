FROM rockylinux:8
LABEL CODENAME="Green Obsidian"
RUN dnf update --assumeyes
RUN dnf install --assumeyes dnf-plugins-core epel-release ansible git vim
RUN dnf distro-sync --assumeyes

WORKDIR /root/source/ansible
COPY . ./
RUN ./mythtv.yml --limit=localhost

WORKDIR /root/source
RUN git clone https://github.com/MythTV/mythtv.git

WORKDIR /root/source/mythtv
RUN git checkout fixes/35
RUN cmake --preset qt5
RUN cmake --build build-qt5
