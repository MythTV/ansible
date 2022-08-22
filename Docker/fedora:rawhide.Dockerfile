FROM fedora:rawhide
LABEL CODENAME="rawhide" EOL="N/A"
RUN dnf install --assumeyes ansible git tree vim
WORKDIR /root/source/ansible
COPY ansible.cfg hosts.yml mythtv.yml roles/ ./
RUN ./mythtv.yml --limit=localhost
