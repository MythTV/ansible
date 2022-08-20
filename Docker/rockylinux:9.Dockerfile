FROM rockylinux:9
LABEL CODENAME="N/A" EOL="N/A"
RUN dnf --assumeyes update
RUN dnf --assumeyes install epel-release
RUN dnf --assumeyes install ansible git vim
WORKDIR /root/source/ansible
COPY ansible.cfg hosts.yml mythtv.yml ./
COPY roles ./roles/
RUN ./mythtv.yml --limit=localhost
