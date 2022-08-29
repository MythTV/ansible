FROM archlinux:latest
# Need this too?: RUN pacman --sync --refresh --sysupgrade --noconfirm
RUN pacman --sync --refresh --sysupgrade --noconfirm ansible git vim

WORKDIR /root/source/ansible
COPY . ./
RUN ./mythtv.yml --limit=localhost

WORKDIR /root/source
RUN git clone https://github.com/MythTV/mythtv.git
WORKDIR /root/source/mythtv/mythtv
RUN git checkout master

RUN ./configure \
    --enable-libx264 \
    --enable-libmp3lame \
    --enable-nonfree \
    --enable-proc-opt
# BE CAREFUL WITH THE NEXT LINE
RUN make --jobs=4
RUN make install

WORKDIR /root/source/mythtv/mythplugins
RUN ./configure
# BE CAREFUL WITH THE NEXT LINE
RUN make --jobs=4
RUN make install
