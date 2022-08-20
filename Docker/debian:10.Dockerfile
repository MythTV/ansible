FROM debian:10
LABEL CODENAME="Buster" EOL="1 Jun 2024"
RUN apt-get update && apt-get install --yes ansible git mlocate python3-apt vim
# Link required because python doesn't exist:
RUN ln -s /usr/bin/python3 /usr/bin/python
WORKDIR /root/source/ansible
COPY ansible.cfg hosts.yml mythtv.yml ./
COPY roles ./roles/
RUN ./mythtv.yml --limit=localhost
