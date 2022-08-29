# Attempt at a 'common' Dockerfile. There are some unique instructions in some
# of the *.Dockerfiles that won't make this easy (without passing mulitple ARGs.
# To use: docker build --build-arg IMAGE=ubuntu:22.04 --tag ubuntu:22.04 .
ARG IMAGE
FROM $IMAGE
ENV TZ=America/Chicago
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && apt-get install --yes ansible git mlocate python3-apt vim

WORKDIR /root/source/ansible
COPY . ./
RUN ./mythtv.yml --limit=localhost

WORKDIR /root/source
RUN git clone https://github.com/MythTV/mythtv.git
WORKDIR /root/source/mythtv/mythtv
RUN git checkout fixes/32

RUN ./configure \
    --enable-libx264 \
    --enable-libmp3lame \
    --enable-nonfree \
    --enable-proc-opt
RUN make --jobs=4
RUN make install

WORKDIR /root/source/mythtv/mythplugins
RUN ./configure
RUN make --jobs=4
RUN make install
