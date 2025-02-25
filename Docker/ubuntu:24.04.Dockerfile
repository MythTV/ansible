FROM ubuntu:24.04
LABEL CODENAME="Noble"
ENV TZ=America/Chicago
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone \
    && apt update \
    && apt install --yes apt-utils ansible git plocate vim

WORKDIR /root/source/ansible
COPY . ./
RUN ./mythtv.yml --limit=localhost --extra-vars='{"venv_active":true}'

WORKDIR /root/source
RUN git clone https://github.com/MythTV/mythtv.git

WORKDIR /root/source/mythtv
RUN git checkout fixes/35 \
    && export VIRTUAL_ENV="/usr/local/dist" \
    && cmake --preset qt5 \
    && cmake --build build-qt5
