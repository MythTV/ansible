#!/usr/bin/env -S retext --preview # Try installing: retext

### Distributions known to the buildbots plus some tests.

TABLE NEEDS UPDATING!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

In the Status column, "Done" means that the Dockerfile instructions
completed the following:

- Installed prerequsite packages (like git and ansible) OK
- Had the MythTV Ansible repro loaded and it executed OK
- Cloned the MythTV repro and checked out a version OK
- Built/installed mythtv OK
- Built/installed mythplugins OK
<br/>

Buildbot Distro Name | Codename | EOL | MythTV | Status | Notes
:--------------------| :------- | :-- | :----- |:------ |:------------------------------------------------------
archlinux | N/A | Rolling | 35 | Done | Ansible=2.18.2
centos8 | Stream8 | 2021-12-31 | 35 | FAILED | Ansible=2.16.3 build can't find libiec61883
centos9 | N/A | Estimated 2027 | 35 | Done | Ansible=2.14.18
debian-buster (10) | Buster | 1 Jun 2024 | 31 | FAILED | Ansible=2.7.7 qmake version issue
debian-bullseye (11) | Bullseye | 15 Aug 2026 | 34 | Done |
debian-bookworm (12) | Bookworm | 30 Jun 2028 | 35 | Done | Ansible=2.16.14???
debian-unstable (N/A) | Trixie | xx xxx 20xx | 35 | FAILED | Ansible=2.18.1 see Dockerfile
fedora40 | N/A | 2025-??-?? | 35 | Done | Ansible=2.16.14
fedora41 | N/A | 2026-??-?? | 35 | Done |Ansible=2.16.14
fedora-aarch64 | N/A | N/A | x |no Dockerfile | No manifest @ hub.docker.com
fedora-armv7hl | N/A | N/A | x |no Dockerfile | No manifest @ hub.docker.com
fedora-rawhide | N/A | N/A | master | Done | Ansible=2.18.1 (with C23 fix in master, not v35 yet)
freebsd12 | N/A | N/A | x |FAILING | tried amontalban:freebsd (only manifest available)
LMDE6 | Faye | N/A | 35 | Done | Ansible=2.14.18
osx | N/A | N/A | x |no Dockerfile | No manifest @ hub.docker.com
opensuse:leap | Leap | November 2022 (for 15.3, 2023 for .4) | 35 | FAILED | Ansible=2.16.5 Not a buildbot distro NEEDS Python.h!!! has gcc v7.5, cmake wants 8 or better
opensuse:tumbleweed | Tumbleweed | "Forever" | 35 | Done | Ansible=2.16.3 Not a buildbot distro Needs Python.h
rockylinux:8 | Green Obsidian | 31 May 2024 | 35 | Done | Ansible=2.16.3 Not a buildbot distro
rockylinux:9 | Blue Onyx | 31 May 2025 | 35 | Done | Ansible=2.14.17 Not a buildbot distro Python 3.9.21 found in /tmp/usr/local...
ubuntu-20.04 | Focal Fossa | 25.04 | 35 | Failed | Ansible=2.9.6, got version: 5.12.8 qmake for Qt 5.15.2 or newer not found.
ubuntu-22.04 | Jammy Jellyfish | 27.04 | 34 | Failed | Ansible=2.10.8 python in: /tmp/usr/local/dist/lib/python3.10/site-packages/MythTV
ubuntu-24.04 | Noble Numbat | 29.04 | 35 | Done | Ansible=2.16.3
alpine:latest | N/A | 23 May 2022 | N/A | T-OK | Test with unknown package manager
amazonlinux:devel | setenforce? | December 31, 2020 | N/A | T-OK | Test with unknown distro
