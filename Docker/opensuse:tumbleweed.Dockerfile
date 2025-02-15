FROM opensuse/tumbleweed
LABEL CODENAME="Tumpleweed, rolling (forever) release"
RUN zypper --non-interactive install awk ansible git vim

WORKDIR /root/source/ansible
COPY . ./
RUN ./mythtv.yml --limit=localhost

WORKDIR /root/source
RUN git clone https://github.com/MythTV/mythtv.git

WORKDIR /root/source/mythtv
RUN git checkout fixes/35
RUN cmake --preset qt5

#    Reports:
#-   Package 'aom' not found
#-   Package 'sdl2' not found
#    Not added to ansible, they don't exist in tumbleweed:

RUN cmake --build build-qt5
