# This actually has value because pip is used to install ansible.
# That's about it as lots of the required packages aren't available.

FROM amazonlinux:latest
RUN dnf install --assumeyes file ansible git less cmake pip python3-packaging python3-setuptools vim
RUN ln /usr/bin/python3 /usr/bin/python
RUN ln /usr/bin/vim /usr/bin/vi

WORKDIR /root/source/ansible
COPY . ./
RUN ./mythtv.yml --limit=localhost

## Above fails with:
# 3.061 TASK [mythtv-dnf : install packages] *******************************************
# 3.061 fatal: [localhost]: FAILED! => changed=false
# 3.061   failures:
# 3.061   - No package ccache available.
# 3.061   - No package exiv2-devel available.
# 3.061   - No package hdhomerun-devel available.
# 3.061   - No package libsamplerate-devel available.
# 3.061   - No package libmpeg2-devel available.
# 3.061   - No package soundtouch-devel available.
# 3.061   - No package lame-devel available.
# 3.061   - No package libXNVCtrl-devel available.
# 3.061   - No package libass-devel available.
# 3.061   - No package libiec61883-devel available.
# 3.061   - No package xvidcore-devel available.
# 3.061   - No package x264-devel available.
# 3.061   - No package x265-devel available.
# 3.061   - No package libdav1d-devel available.
# 3.061   - No package libcec-devel available.
# 3.061   - No package perl-DateTime-Format-ISO8601 available.
# 3.061   - No package perl-SOAP-Lite available.
# 3.061   - No package perl-Net-UPnP available.
# 3.061   - No package libcdio-devel available.
# 3.061   - No package libcdio-paranoia-devel available.
# 3.061   - No package mysql-devel available.
# 3.061   - No package minizip-devel available.
# 3.061   msg: Failed to install some of the specified packages

# Won't get here.
WORKDIR /root/source
RUN git clone https://github.com/MythTV/mythtv.git

WORKDIR /root/source/mythtv
RUN git checkout fixes/35
RUN cmake --preset qt5
RUN cmake --build build-qt5
