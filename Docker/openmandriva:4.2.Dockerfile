FROM openmandriva/4.2:latest
RUN dnf install --assumeyes git make python-packaging python-setuptools vim

# Last checked, OpenMandriva only has Ansible 1.6 in their repositories,
# install from source.
WORKDIR /root/source
RUN git clone https://github.com/ansible/ansible.git ansible-stable

WORKDIR /root/source/ansible-stable
RUN git checkout -b stable-2.15 origin/stable-2.15 \
    && make install

WORKDIR /root/source/ansible
COPY . ./
RUN ./mythtv.yml --limit=localhost

WORKDIR /root/source
RUN git clone https://github.com/MythTV/mythtv.git

WORKDIR /root/source/mythtv/mythtv
RUN git checkout fixes/35

# RUN ./configure \
#     --enable-libx264 \
#     --enable-libmp3lame \
#     --enable-nonfree \
#     --enable-proc-opt
# # ADJUST THE NEXT LINE. Don't use $(nproc)
# RUN make --jobs=4
# RUN make install

# WORKDIR /root/source/mythtv/mythplugins
# RUN ./configure
# # ADJUST THE NEXT LINE. Don't use $(nproc)
# RUN make --jobs=4
# RUN make install
