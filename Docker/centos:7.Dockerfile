FROM centos:7
LABEL CODENAME="N/A" EOL="2024-06-30"
RUN yum --assumeyes distribution-synchronization
RUN yum --assumeyes install centos-release-ansible-29.noarch git vim-enhanced
WORKDIR /root/source/ansible
COPY . ./
RUN ./mythtv.yml --limit=localhost
