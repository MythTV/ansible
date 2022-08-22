# A centos:9 manifest is unknown to hub.docker.com
# The package manager would probably be dnf too.
FROM centos:9
LABEL CODENAME="N/A" EOL="N/A"
RUN yum --assumeyes distribution-synchronization
RUN yum --assumeyes install centos-release-ansible-29.noarch git tree vim-enhanced
WORKDIR /root/source/ansible
COPY . ./
RUN ./mythtv.yml --limit=localhost
