FROM debian:11
LABEL CODENAME="Bullseye" EOL="15 Aug 2026"
RUN apt-get update && apt-get install --yes ansible git mlocate python3-apt vim
WORKDIR /root/source/ansible
COPY . ./
RUN ./mythtv.yml --limit=localhost
