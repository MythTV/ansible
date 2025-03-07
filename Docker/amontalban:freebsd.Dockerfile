FROM amontalban/freebsd
RUN pkg install ansible git vim

# This only works with the devel/2022 branch!!!
WORKDIR /root/source/ansible
COPY . ./
RUN ./mythtv.yml --limit=localhost --extra-vars='{"venv_active":true}'

WORKDIR /root/source
RUN git clone https://github.com/MythTV/mythtv.git

#WORKDIR /root/source/mythtv/mythtv
#RUN git checkout fixes/35 \
#    && ./configure \
#        --enable-libx264 \
#        --enable-libmp3lame \
#        --enable-nonfree \
#        --enable-proc-opt \
#    && make --jobs=4 \
#    && make install
#
#WORKDIR /root/source/mythtv/mythplugins
#RUN ./configure \
#    && make --jobs=4 \
#    && make install
