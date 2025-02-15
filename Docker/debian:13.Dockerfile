FROM debian:13
LABEL CODENAME="Trixie, testing no release date set"
RUN apt-get update && apt-get install --yes ansible git plocate python3-apt vim

WORKDIR /root/source/ansible
COPY . ./
RUN ./mythtv.yml --limit=localhost

WORKDIR /root/source
RUN git clone https://github.com/MythTV/mythtv.git

WORKDIR /root/source/mythtv
RUN git checkout fixes/35
RUN cmake --preset qt5
RUN cmake --build build-qt5
