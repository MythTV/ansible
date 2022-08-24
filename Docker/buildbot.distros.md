#!/usr/bin/env -S retext --preview # Install retext, file becomes executable

### Distributions known to the buildbots.

In the Status column, "Done" means that the Dockerfile instructions
completed the following:

- Installed prerequsite packages (like git and ansible) OK
- Had the MythTV Ansible repro loaded and it executed OK
- Cloned the MythTV repro and checked out the proper version OK
- Built mythtv OK
- Built mythplugins OK
<br/>

Buildbot Distro Name | MythTV | Status | Notes
:--------------------| :----- |:------ |:------------------------------------------------------
archlinux | master |Done
centos8 | 32 |FAILING | Playbook fails python-dnf issue
centos9 | x |FAILING | No manifest @ hub.docker.com
debian-buster (10) | 31 |Done | Not on buildbot?
debian-bullseye (11) | 31 |Done
debian-bookworm (12) | 32 |Done
f34 | 32 |Done |
f35 | 31 |Done |
f36 | 31 |Done |
fedora-aarch64 | x |no Dockerfile | No manifest @ hub.docker.com
fedora-armv7hl | x |no Dockerfile | No manifest @ hub.docker.com
fedora-rawhide | 31 |Done |
freebsd12 | x |FAILING | tried amontalban:freebsd (only manifest available)
osx | x |no Dockerfile | No manifest @ hub.docker.com
ubuntu-20.04 | 31 |Done |
ubuntu-22.04 | 32 |Done |
