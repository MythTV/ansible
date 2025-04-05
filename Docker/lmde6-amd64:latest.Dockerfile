FROM linuxmintd/lmde6-amd64:latest
ARG NOBUILD=0
LABEL CODENAME="Faye"
RUN apt-get update \
    && apt-get install --yes apt-utils ansible git plocate python3-apt vim

WORKDIR /root/source/ansible
COPY . ./
RUN ./mythtv.yml --limit=localhost --extra-vars='{"venv_active": true}' --extra-vars='{"use_old_roles": false}'

WORKDIR /root/source
RUN git clone https://github.com/MythTV/mythtv.git

WORKDIR /root/source/mythtv
RUN if [ "${NOBUILD}" -eq 1 ]; then \
        echo "Not doing a build." ;\
    else \
        git checkout fixes/35 \
        && cmake --preset qt5 \
        && VIRTUAL_ENV=/usr/local/dist cmake --build build-qt5 ;\
    fi
