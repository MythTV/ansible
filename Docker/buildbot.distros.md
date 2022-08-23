#!/usr/bin/env -S retext --preview

### Distributions known to the buildbots.

In the Status column, "Done" means that the Dockerfile instructions
completed the following:

- Installed prerequsite packages (like git and ansible) OK
- Had the MythTV Ansible repro loaded and it executed OK
- Cloned the MythTV repro and checked out the proper version OK
- Built mythtv oK
- Built mythplugins OK
<br/>

Buildbot Distro Name | Status | Notes
:--------------------|:-------|:------------------------------------------------------
archlinux | Done
centos8 | FAILING | EOL 2021-12-31, WIP, playbook fails python-dnf issue
centos9 | FAILING
debian-buster | Done | Debian:10 at Docker, EOL 1 Jun 2024 why not a buildbot
debian-bookworm | Done
debian-bullseye | Done
f34 | FAILING | EOL 2022-06-07, ERROR: libXxf86vm not found
f35 | Done | EOL 2022-11-15
f36 | Done | EOL 2023-05-16
fedora-aarch64 | no Dockerfile |
fedora-armv7hl | no Dockerfile |
fedora-rawhide | Done |
freebsd12 | FAILING | added amontalban:freebsd.Dockerfile (the only image available)
osx | no Dockerfile yet |
ubuntu-20.04 | Done |
ubuntu-22.04 | Done |
