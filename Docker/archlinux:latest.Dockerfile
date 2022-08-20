FROM archlinux:latest
LABEL CODENAME="N/A" EOL="N/A"
RUN pacman --sync --refresh --sysupgrade --noconfirm
RUN pacman --sync --refresh --sysupgrade --noconfirm ansible git vim
WORKDIR /root/source/ansible
COPY ansible.cfg hosts.yml mythtv.yml ./
COPY roles ./roles/
RUN ./mythtv.yml --limit=localhost
