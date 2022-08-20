FROM centos:9
LABEL CODENAME="?" EOL="?"
RUN yum --assumeyes distribution-synchronization
RUN yum --assumeyes install centos-release-ansible-29.noarch git vim-enhanced
WORKDIR /root/source/ansible
COPY ansible.cfg hosts.yml mythtv.yml ./
COPY roles ./roles/
RUN ./mythtv.yml --limit=localhost
