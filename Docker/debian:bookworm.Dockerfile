FROM debian:bookworm
LABEL CODENAME="bookworm" EOL="N/A"
LABEL NOTE="This will become debian:12. The --tag and filename should be renamed."
RUN apt-get update && apt-get install --yes ansible git mlocate python3-apt vim
WORKDIR /root/source/ansible
COPY ansible.cfg hosts.yml mythtv.yml ./
COPY roles ./roles/
RUN ./mythtv.yml --limit=localhost
