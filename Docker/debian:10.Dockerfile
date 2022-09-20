FROM debian:10
RUN apt-get update && apt-get install --yes ansible git mlocate python3-apt vim
# Link required because python doesn't exist:
RUN ln -s /usr/bin/python3 /usr/bin/python
WORKDIR /root/source/ansible
COPY . ./
RUN ./mythtv.yml --limit=localhost

WORKDIR /root/source
RUN git clone https://github.com/MythTV/mythtv.git
WORKDIR /root/source/mythtv/mythtv
RUN git checkout fixes/31

RUN ./configure \
    --enable-libx264 \
    --enable-libmp3lame \
    --enable-nonfree \
    --enable-proc-opt
# ADJUST THE NEXT LINE. Don't use $(nproc)
RUN make --jobs=4
RUN make install

WORKDIR /root/source/mythtv/mythplugins
RUN ./configure
# ADJUST THE NEXT LINE. Don't use $(nproc)
RUN make --jobs=4
RUN make install
