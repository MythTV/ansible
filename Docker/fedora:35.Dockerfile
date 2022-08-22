FROM fedora:35
LABEL CODENAME="N/A" EOL="2022-11-15"
RUN dnf install --assumeyes ansible git tree vim
WORKDIR /root/source/ansible
COPY . ./
RUN ./mythtv.yml --limit=localhost
