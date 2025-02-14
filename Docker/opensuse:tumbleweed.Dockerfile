FROM opensuse/tumbleweed
RUN zypper --non-interactive install ansible git vim

WORKDIR /root/source/ansible
COPY . ./
RUN ./mythtv.yml --limit=f30

WORKDIR /root/source
RUN git clone https://github.com/MythTV/mythtv.git

WORKDIR /root/source/mythtv
RUN git checkout fixes/35
RUN cmake --preset qt5
RUN cmake --build build-qt5
