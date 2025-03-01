FROM ubuntu:22.04
LABEL CODENAME="Jammy"
ENV TZ=America/Chicago
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone \
    && apt update \
    && apt install --yes apt-utils ansible git plocate python3-apt vim

WORKDIR /root/source/ansible
COPY . ./
RUN ./mythtv.yml --limit=localhost --extra-vars='{"venv_active":true}'

WORKDIR /root/source
RUN git clone https://github.com/MythTV/mythtv.git

# 22.04 has python v3.10
WORKDIR /root/source/mythtv
RUN git checkout fixes/34 \
    && cmake --preset qt5 \
    && VIRTUAL_ENV=/usr/local/dist cmake --build build-qt5 ######## -DMYTH_BINDINGS_INSTALL_ROOT=/usr/local/dist
