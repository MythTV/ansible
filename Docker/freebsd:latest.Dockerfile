########## This image doesn't exist, just wanted to try it
FROM freebsd:latest
ARG NOBUILD=0
RUN pkg install ansible git vim

WORKDIR /root/source/ansible
COPY . ./
RUN ls -al /root/source/ansible
# RUN ./mythtv.yml --limit=localhost --extra-vars='{"venv_active": true}'

# WORKDIR /root/source
# RUN git clone https://github.com/MythTV/mythtv.git

# RUN if [ "${NOBUILD}" -eq 1 ]; then \
#         echo "Not doing a build." ;\
#     else \
#         git checkout fixes/35 \
#         && cmake --preset qt5 \
#         && VIRTUAL_ENV=/usr/local/dist cmake --build build-qt5 ;\
#     fi
