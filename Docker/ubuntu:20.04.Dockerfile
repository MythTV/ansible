FROM ubuntu:20.04
ARG NOBUILD=0
LABEL CODENAME="Focal"
ENV TZ=America/Chicago
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone \
    && apt-get update \
    && apt-get install --yes apt-utils ansible git python3-apt vim

# Ubuntu 20.04 can't: pip install mysqlclient
WORKDIR /root/source/ansible
COPY . ./
RUN ./mythtv.yml --limit=localhost --extra-vars='{"venv_active": true}' --extra-vars='{"use_old_roles": false}'

WORKDIR /root/source
RUN git clone https://github.com/MythTV/mythtv.git

# Looks like cmake v3.16.3 doesn't have the --preset switch, so use make
WORKDIR /root/source/mythtv/mythtv
RUN if [ "${NOBUILD}" -eq 1 ]; then \
        echo "Not doing a build." ;\
    else \
        git checkout fixes/35 \
        && cmake --preset qt5 \
        && VIRTUAL_ENV=/usr/local/dist cmake --build build-qt5 ;\
    fi

#RUN git checkout fixes/35 \
#    && ./configure \
#        --enable-libx264 \
#        --enable-libmp3lame \
#        --enable-nonfree \
#        --enable-proc-opt \
#    && VIRTUAL_ENV=/usr/local/dist make --jobs=4 \
#    && make install
#
#WORKDIR /root/source/mythtv/mythplugins
#RUN ./configure && make --jobs=4 && make install

#    && cmake --preset qt5
#    && cmake --build build-qt5
#    && VIRTUAL_ENV=/usr/local/dist cmake --build build-qt5
######### line from 22.04 with python 3.10.2 may not be correct   && cmake --build build-qt5 -DMYTH_BINDINGS_INSTALL_ROOT=/usr/local/dist
