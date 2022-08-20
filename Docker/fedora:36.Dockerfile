FROM fedora:36
LABEL CODENAME="N/A" EOL="2023-05-16"
RUN dnf install --assumeyes ansible git vim
WORKDIR /root/source/ansible
COPY ansible.cfg hosts.yml mythtv.yml ./
COPY roles ./roles/
RUN ./mythtv.yml --limit=localhost
