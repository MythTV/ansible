FROM rockylinux:9
LABEL CODENAME="Blue Onyx" EOL="N/A"
RUN dnf --assumeyes update
RUN dnf --assumeyes install epel-release
RUN dnf --assumeyes install ansible git vim
WORKDIR /root/source/ansible
COPY . ./
# RUN ./mythtv.yml --limit=localhost
