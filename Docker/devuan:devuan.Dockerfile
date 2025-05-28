FROM devuan/devuan:latest
ARG NOBUILD=0
LABEL CODENAME="daedalus (v5)"
RUN apt update \
    && apt install --yes apt-utils ansible git plocate vim
CMD bash

WORKDIR /root/source/ansible
COPY . ./
########### RUN ansible-galaxy collection install --requirements-file=requirements.yml \
###########     && ./mythtv.yml --limit=localhost --extra-vars='{"venv_active": true}' --extra-vars='{"use_old_roles": false}'
########### 
########### WORKDIR /root/source
########### RUN git clone https://github.com/MythTV/mythtv.git
########### 
########### WORKDIR /root/source/mythtv
########### RUN if [ "${NOBUILD}" -eq 1 ]; then \
###########         echo "Not doing a build." ;\
###########     else \
###########         git checkout fixes/35 \
###########         && cmake --preset qt5 \
###########         && VIRTUAL_ENV=/usr/local/dist cmake --build build-qt5 ;\
###########     fi
