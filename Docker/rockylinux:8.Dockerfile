FROM rockylinux:8
LABEL CODENAME="Green Obsidian"
RUN dnf update --assumeyes \
    && dnf install --assumeyes dnf-plugins-core epel-release ansible-core git vim \
    && dnf distro-sync --assumeyes

WORKDIR /root/source/ansible
COPY . ./
RUN ansible-galaxy collection install --requirements-file=requirements.yml \
    && ./mythtv.yml --limit=localhost

WORKDIR /root/source
RUN git clone https://github.com/MythTV/mythtv.git

WORKDIR /root/source/mythtv/mythtv
RUN git checkout fixes/34 \
    && ./configure \
        --enable-libx264 \
        --enable-libmp3lame \
        --enable-nonfree \
        --enable-proc-opt \
    && make --jobs \
    && make install

WORKDIR /root/source/mythtv/mythplugins
RUN ./configure && make --jobs && make install

# Issue using cmake, can't find overlay.h (bluray)
# WORKDIR /root/source/mythtv
# RUN git checkout fixes/35
# RUN cmake -DENABLE_BDJAVA=OFF --preset qt5
# RUN cmake --build build-qt5
