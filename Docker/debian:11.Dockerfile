FROM debian:11
ARG NOBUILD=0
LABEL CODENAME="Bullseye, oldstable"
RUN apt-get update \
    && apt-get install --yes apt-utils ansible git plocate python3-apt vim

WORKDIR /root/source/ansible
COPY . ./
RUN ./mythtv.yml --limit=localhost --extra-vars='{"venv_active":true}'

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

#RUN git checkout fixes/34 \
#    && ./configure \
#        --enable-libx264 \
#        --enable-libmp3lame \
#        --enable-nonfree \
#        --enable-proc-opt \
#    && . /usr/local/dist/bin/activate \
#    && make --jobs=4 \
#    && make install
#
#WORKDIR /root/source/mythtv/mythplugins
#RUN ./configure \
#    && make --jobs=4 \
#    && make install
