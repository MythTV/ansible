FROM archlinux:latest
ARG MY_USER_AND_GROUP
ARG NOBUILD=0
RUN pacman --sync --refresh --sysupgrade --noconfirm ansible git vim \
    && ln --symbolic --force /usr/bin/vim /usr/bin/vi \
    && groupadd --force --system sudo \
    && useradd ${MY_USER_AND_GROUP} || true \
    && usermod --append --groups sudo ${MY_USER_AND_GROUP}

WORKDIR /root/source/ansible
COPY . ./
RUN ./mythtv.yml --limit=localhost --extra-vars='{"venv_active": true}' --extra-vars='{"use_old_roles": false}'

WORKDIR /root/source
RUN git clone https://github.com/MythTV/mythtv.git

RUN if [ "${NOBUILD}" -eq 1 ]; then \
        echo "Not doing a build." ;\
    else \
        git checkout fixes/35 \
        && cmake --preset qt5 \
        && VIRTUAL_ENV=/usr/local/dist cmake --build build-qt5 ;\
    fi
