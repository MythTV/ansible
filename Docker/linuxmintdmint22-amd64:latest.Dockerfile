FROM linuxmintd/mint22-amd64:latest
ARG NOBUILD=0
LABEL CODENAME="fillMEin, /etc/lsb said this was Ubuntu noble"
RUN apt-get update \
    && apt-get install --yes apt-utils ansible git plocate python3-apt vim

WORKDIR /root/source/ansible
COPY . ./
RUN ./mythtv.yml --limit=localhost --extra-vars='{"venv_active": true}' --extra-vars='{"use_old_roles": true}'

WORKDIR /root/source
RUN git clone https://github.com/MythTV/mythtv.git

WORKDIR /root/source/mythtv
RUN if [ "${NOBUILD}" -eq 1 ]; then \
        echo "Not doing a build." ;\
    else \
        git checkout fixes/35 \
        && cmake --preset qt5 \
        && VIRTUAL_ENV=/usr/local/dist cmake --build build-qt5 ;\
    fi

# TASK [common : Include the following on all trouble tickets or questions] ******
# ok: [localhost] => {
#     "msg": [
#         "inventory_hostname:                 localhost",
#         "ansible_distribution:               Ubuntu", <-------------
#         "ansible_distribution_release:       noble",  <-------------
#         "ansible_distribution_major_version: 24",     <-------------
#         "ansible_lsb.major_release:          24",     <-------------
#         "ansible_pkg_mgr:                    apt",
#         "ansible_version.full:               2.16.3"
