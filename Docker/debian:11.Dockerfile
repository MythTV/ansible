FROM debian:11
LABEL CODENAME="Bullseye, oldstable"
RUN apt-get update \
    && apt-get install --yes ansible git plocate python3-apt vim

WORKDIR /root/source/ansible
COPY . ./
RUN ./mythtv.yml --limit=localhost

WORKDIR /root/source
RUN git clone https://github.com/MythTV/mythtv.git

WORKDIR /root/source/mythtv/mythtv
RUN git checkout fixes/34 \
    && ./configure \
        --enable-libx264 \
        --enable-libmp3lame \
        --enable-nonfree \
        --enable-proc-opt \
    && make --jobs \
    && make install

WORKDIR /root/source/mythtv/mythplugins
RUN ./configure \
    && make --jobs=4 \
    && make install
