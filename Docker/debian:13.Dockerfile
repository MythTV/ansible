FROM debian:trixie
# Missing: g++              <----------------------------------
# Missing: libcrystalhd-dev <----------------------------------
# Missing: libfreetype6-dev <----------------------------------

LABEL CODENAME="Trixie, probably v13,  testing no release date set"
RUN apt-get update \
    && apt-get install --yes apt-utils ansible git plocate python3-apt vim

WORKDIR /root/source/ansible
COPY . ./
#RUN ./mythtv.yml --limit=localhost --extra-vars='{"venv_active":true}'

#WORKDIR /root/source
#RUN git clone https://github.com/MythTV/mythtv.git
#
#WORKDIR /root/source/mythtv
#RUN git checkout fixes/35 \
#    && cmake --preset qt5 \
#    && VIRTUAL_ENV=/usr/local/dist cmake --build build-qt5
