FROM opensuse/tumbleweed
RUN zypper --non-interactive install ansible git vim

WORKDIR /root/source/ansible
COPY . ./
RUN ./mythtv.yml --limit=f30

WORKDIR /root/source
RUN git clone https://github.com/MythTV/mythtv.git
WORKDIR /root/source/mythtv/mythtv
RUN git checkout fixes/32

RUN ./configure \
    --enable-libmp3lame \
    --enable-nonfree \
    --disable-x86asm \
    --enable-proc-opt

# BE CAREFUL WITH THE NEXT LINE
RUN make --jobs=4
RUN make install

WORKDIR /root/source/mythtv/mythplugins
RUN ./configure
# BE CAREFUL WITH THE NEXT LINE
RUN make --jobs=4
RUN make install
