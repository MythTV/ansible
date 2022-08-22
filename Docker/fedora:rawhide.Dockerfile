FROM fedora:rawhide
LABEL CODENAME="rawhide" EOL="N/A"
RUN dnf install --assumeyes ansible git tree vim
WORKDIR /root/source/ansible
COPY . ./
RUN ./mythtv.yml --limit=localhost
