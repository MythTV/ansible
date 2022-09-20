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

Buildbot Distro Name | Codename | EOL | MythTV | Status | Notes
:--------------------| :------- | :-- | :----- |:------ |:------------------------------------------------------
archlinux | N/A | Rolling | master | Done |
centos8 | N/A | 2021-12-31 | 32 |FAILING | Playbook fails python-dnf issue. Using rockylinux:8 below
centos9 | N/A | Estimated 2027 | x |FAILING | No manifest @ hub.docker.com. Using: rockylinux:9 below
debian-buster (10) | Buster | 1 Jun 2024 | 31 | Done | Not on buildbot?
debian-bullseye (11) | Bullseye | 15 Aug 2026 | 31 | Done |
debian-bookworm (12) | bookworm | N/A | 32 | Done |
f34 | N/A | 2022-06-07 | 32 | Done |
f35 | N/A | 2022-11-15 | 32 | Done |
f36 | N/A | 2023-05-16 | 32 | Done |
fedora-aarch64 | N/A | N/A | x |no Dockerfile | No manifest @ hub.docker.com
fedora-armv7hl | N/A | N/A | x |no Dockerfile | No manifest @ hub.docker.com
fedora-rawhide | N/A | N/A | 31 | Done |
freebsd12 | N/A | N/A | x |FAILING | tried amontalban:freebsd (only manifest available)
osx | N/A | N/A | x |no Dockerfile | No manifest @ hub.docker.com
opensuse:leap | Leap | November 2022 (for 15.3, 2023 for .4) | 32 | Done | Not a buildbot distro
opensuse:tumbleweed | Tumbleweed | "Forever" | 32 | Done | Not a buildbot distro
rockylinux:8 | Green Obsidian | 31 May 2024 | 32 | Done | Not a buildbot distro
rockylinux:9 | Blue Onyx | 31 May 2025 | 32 | Done | Not a buildbot distro
ubuntu-20.04 | Focal Fossa | 25.04 | 31 | Done |
ubuntu-22.04 | Jammy Jellyfish | 27.04 | 32 | Done |
alpine:latest | N/A | 23 May 2022 | N/A | T-OK | Test with unknown package manager
amazonlinux:devel | setenforce? | December 31, 2020 | N/A | T-OK | Test with unknown distro
