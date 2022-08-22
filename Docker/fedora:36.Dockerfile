FROM fedora:36
LABEL CODENAME="N/A" EOL="2023-05-16"
RUN dnf install --assumeyes ansible git tree vim
WORKDIR /root/source/ansible
COPY . ./
RUN ./mythtv.yml --limit=localhost
