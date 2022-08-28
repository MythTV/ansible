#!/usr/bin/env -S retext --preview # Try installing: retext

### Distributions known to the buildbots and some tests.

In the Status column, "Done" means that the Dockerfile instructions
completed the following:

- Installed prerequsite packages (like git and ansible) OK
- Had the MythTV Ansible repro loaded and it executed OK
- Cloned the MythTV repro and checked out a version OK
- Built/installed mythtv OK
- Built/installed mythplugins OK
<br/>

Buildbot Distro Name | MythTV | Status | Notes
:--------------------| :----- |:------ |:------------------------------------------------------
archlinux | master | Done |
centos8 | 32 |FAILING | Playbook fails python-dnf issue. Using rockylinux:8 below
centos9 | x |FAILING | No manifest @ hub.docker.com. Using: rockylinux:9 below
debian-buster (10) | 31 | Done | Not on buildbot?
debian-bullseye (11) | 31 | Done |
debian-bookworm (12) | 32 | Done |
f34 | 32 | Done |
f35 | 32 | Done |
f36 | 32 | Done |
fedora-aarch64 | x |no Dockerfile | No manifest @ hub.docker.com
fedora-armv7hl | x |no Dockerfile | No manifest @ hub.docker.com
fedora-rawhide | 31 | Done |
freebsd12 | x |FAILING | tried amontalban:freebsd (only manifest available)
osx | x |no Dockerfile | No manifest @ hub.docker.com
opensuse:leap | 32 | Done | Not a buildbot distro
opensuse:tumbleweed | 32 | Done | Not a buildbot distro
rockylinux:8 | 32 | Done | Not a buildbot distro
rockylinux:9 | 32 | Done | Not a buildbot distro
ubuntu-20.04 | 31 | Done |
ubuntu-22.04 | 32 | Done |
alpine:latest | N/A | T-OK | Test with unknown package manager
amazonlinux:devel | N/A | T-OK | Test with unknown distro
