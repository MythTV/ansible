FROM opensuse/leap:latest
ARG NOBUILD=0
LABEL CODENAME="Leap, 'regular' release"
LABEL FAILED_CONFIGURE="MythTV requires GCC 8 or better."
RUN zypper --non-interactive install awk ansible git plocate vim

WORKDIR /root/source/ansible
COPY . ./
RUN ./mythtv.yml --limit=localhost --extra-vars='{"venv_active": true}' --extra-vars='{"use_old_roles": false}'

WORKDIR /root/source
RUN git clone https://github.com/MythTV/mythtv.git

WORKDIR /root/source/mythtv/mythtv
RUN if [ "${NOBUILD}" -eq 1 ]; then \
        echo "Not doing a build." ;\
    else \
        git checkout fixes/35 \
        && cmake --preset qt5 \
        && VIRTUAL_ENV=/usr/local/dist cmake --build build-qt5 ;\
    fi

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
