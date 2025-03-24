# These instructions test the MythTV playbook's ability to
# handle a distro that uses an unexpected package manager. It
# should run the common role only (which prints the information
# required to add a new role.)

FROM alpine:latest
ARG NOBUILD=0
RUN apk update \
    && apk add --latest ansible less vim

WORKDIR /root/source/ansible
COPY . ./
RUN ./mythtv.yml --limit=localhost --extra-vars='{"venv_active":true}'

# Never build here, at least for now.
RUN if [ "${NOBUILD}" -eq 1 ]; then \
        echo "Not doing a build." ;\
    else \
        git checkout fixes/35 \
        && cmake --preset qt5 \
        && VIRTUAL_ENV=/usr/local/dist cmake --build build-qt5 ;\
    fi
