# These instructions test the MythTV playbook's ability to
# handle a distro that uses an unexpected package manager. It
# is should run the common role only (which prints the information
# required to add a new role.)

FROM alpine:latest
RUN apk update && apk add --latest ansible less vim

WORKDIR /root/source/ansible
COPY . ./
RUN ./mythtv.yml --limit=f30
