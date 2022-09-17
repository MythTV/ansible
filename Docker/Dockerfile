# Attempt at a single Dockerfile. There are unique instructions in some of
# the *.Dockerfiles that won't make this easy (without passing mulitple ARGs).
# Example: docker build --build-arg IMAGE=ubuntu:20.04 --tag ubuntu:20.04 .

ARG IMAGE
FROM $IMAGE
RUN apt-get update && apt-get install --yes ansible

# Things that may be common...
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
RUN make
RUN make install

WORKDIR /root/source/mythtv/mythplugins
RUN ./configure
RUN make
RUN make install
