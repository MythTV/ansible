FROM rockylinux:8
LABEL CODENAME="Green Obsidian"
RUN dnf update --assumeyes
RUN dnf install --assumeyes dnf-plugins-core epel-release ansible-core git vim
RUN dnf distro-sync --assumeyes

WORKDIR /root/source/ansible
COPY . ./
RUN ansible-galaxy collection install --requirements-file=requirements.yml
RUN ./mythtv.yml --limit=localhost

WORKDIR /root/source
RUN git clone https://github.com/MythTV/mythtv.git

WORKDIR /root/source/mythtv/mythtv
RUN git checkout fixes/34

RUN ./configure \
    --enable-libx264 \
    --enable-libmp3lame \
    --enable-nonfree \
    --enable-proc-opt
# ADJUST THE NEXT LINE. Don't use $(nproc)
RUN make --jobs=8
RUN make install

WORKDIR /root/source/mythtv/mythplugins
RUN ./configure
# ADJUST THE NEXT LINE. Don't use $(nproc)
RUN make --jobs=8
RUN make install

# Can't use cmake, can't fine overlay.h (bluray)
# WORKDIR /root/source/mythtv
# RUN git checkout fixes/35
# RUN cmake -DENABLE_BDJAVA=OFF --preset qt5
# RUN cmake --build build-qt5
