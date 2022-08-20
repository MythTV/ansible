FROM fedora:35
LABEL CODENAME="N/A" EOL="2022-11-15"
RUN dnf install --assumeyes ansible git vim
WORKDIR /root/source/ansible
COPY ansible.cfg hosts.yml mythtv.yml ./
COPY roles ./roles/
RUN ./mythtv.yml --limit=localhost
