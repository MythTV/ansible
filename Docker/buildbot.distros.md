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
archlinux | N/A | Rolling | 35 | Done |
centos7 | N/A | 2024-6-30 | 35 | FAILED | "Could not resolve host: mirrorlist.centos.org; Unknown error"
centos8 | Stream8 | 2021-12-31 | 32 | IP | Ansible=2.16.3
centos9 | N/A | Estimated 2027 | 35 |IP | Ansible=2.14.18 MISSING Python.h for mysqllibm=. python 3.9.21 uses: /tmp/usr/local/dist/lib/python3.9/site-packages/MythTV
debian-buster (10) | Buster | 1 Jun 2024 | 31 | IP | Not on buildbot?
debian-bullseye (11) | Bullseye | 15 Aug 2026 | 34 | IP |
debian-bookworm (12) | Bookworm | 30 Jun 2028 | 35 | Done |
debian-trixie (13) | rawhide? | xx xxx 20xx | 35 | Done |
f34 | N/A | 2022-06-07 | 32 | IP |
f35 | N/A | 2022-11-15 | 32 | IP |
f36 | N/A | 2023-05-16 | 32 | IP |
f37 | N/A | 202?-??-?? | 32 | IP |
fedora-aarch64 | N/A | N/A | x |no Dockerfile | No manifest @ hub.docker.com
fedora-armv7hl | N/A | N/A | x |no Dockerfile | No manifest @ hub.docker.com
fedora-rawhide | N/A | N/A | 31 | IP | Development release is here
freebsd12 | N/A | N/A | x |FAILING | tried amontalban:freebsd (only manifest available)
osx | N/A | N/A | x |no Dockerfile | No manifest @ hub.docker.com
opensuse:leap | Leap | November 2022 (for 15.3, 2023 for .4) | 32 | IP | Not a buildbot distro
opensuse:tumbleweed | Tumbleweed | "Forever" | 32 | IP | Not a buildbot distro
rockylinux:8 | Green Obsidian | 31 May 2024 | 32 | IP | Not a buildbot distro
rockylinux:9 | Blue Onyx | 31 May 2025 | 32 | IP | Not a buildbot distro
ubuntu-20.04 | Focal Fossa | 25.04 | 31 | Failed | Ansible=2.9.6 got version: 5.12.8 qmake for Qt 5.15.2 or newer not found.
ubuntu-22.04 | Jammy Jellyfish | 27.04 | 34 | Done | Ansible=2.10.8
ubuntu-24.04 | Noble Numbat | 29.04 | 35 | Done | Ansible=2.16.3
alpine:latest | N/A | 23 May 2022 | N/A | T-OK | Test with unknown package manager
amazonlinux:devel | setenforce? | December 31, 2020 | N/A | T-OK | Test with unknown distro
