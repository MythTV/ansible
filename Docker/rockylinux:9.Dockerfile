FROM rockylinux:9
LABEL CODENAME="Blue Onyx" EOL="N/A"
RUN dnf update --assumeyes
RUN dnf install --assumeyes dnf-plugins-core epel-release
RUN dnf install --assumeyes ansible git vim
RUN dnf distro-sync --assumeyes
WORKDIR /root/source/ansible
COPY . ./
# RUN ./mythtv.yml --limit=localhost
