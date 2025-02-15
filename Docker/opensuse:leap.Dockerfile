FROM opensuse/leap
LABEL CODENAME="Leap, 'regular' release"
LABEL FAILED_CONFIGURE="MythTV requires GCC 8 or better."
RUN zypper --non-interactive install awk ansible git plocate vim

WORKDIR /root/source/ansible
COPY . ./
RUN ./mythtv.yml --limit=localhost

WORKDIR /root/source
RUN git clone https://github.com/MythTV/mythtv.git
WORKDIR /root/source/mythtv/mythtv
RUN git checkout fixes/34

# make and cmake fail, gcc13 exists, but gcc links to gcc8
# RUN ./configure \
#     --enable-libmp3lame \
#     --enable-nonfree \
#     --disable-x86asm \
#     --enable-proc-opt
# # BE CAREFUL WITH THE NEXT LINE
# RUN make --jobs=4
# RUN make install
# 
# WORKDIR /root/source/mythtv/mythplugins
# RUN ./configure
# # # BE CAREFUL WITH THE NEXT LINE
# RUN make --jobs=4
# RUN make install

# WORKDIR /root/source/mythtv
# RUN git checkout fixes/35
# RUN cmake --preset qt5
