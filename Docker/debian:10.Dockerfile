FROM debian:10
LABEL CODENAME="Buster, Archived"
RUN apt-get update \
    && apt-get install --yes apt-utils ansible git python3 python3-apt vim #\
    # && ln -s /usr/bin/python3 /usr/bin/python

WORKDIR /root/source/ansible
COPY . ./
RUN ./mythtv.yml --limit=localhost --extra-vars='{"venv_active": true}' --extra-vars='{"use_old_roles": false}'

WORKDIR /root/source
RUN git clone https://github.com/MythTV/mythtv.git

# Not in my list of distros at github, stopping here due to:
# qmake for Qt 5.12 or newer not found when configure runs.
WORKDIR /root/source/mythtv/mythtv
RUN if [ "${NOBUILD}" -eq 1 ]; then \
        echo "Not doing a build." ;\
    else \
        git checkout fixes/35 \
        && cmake --preset qt5 \
        && VIRTUAL_ENV=/usr/local/dist cmake --build build-qt5 ;\
    fi

#    && ./configure \
#        --enable-libx264 \
#        --enable-libmp3lame \
#        --enable-nonfree \
#        --enable-proc-opt \
#    && VIRTUAL_ENV=/usr/local/dist make --jobs=8 \
#    && make install

#WORKDIR /root/source/mythtv/mythplugins
#RUN ./configure \
#    && make --jobs=8 \
#    && make install
