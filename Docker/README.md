#!/usr/bin/env -S retext --preview

[//]: # (Install retext from your distribution then ./README.md will look prettier.)

## Introduction

This was developed/tested on an Ubuntu 22.04 host running *Docker* version
20.10.17.  NB The *Docker Context* (the directory above this README.md)
**MUST BE** in your $HOME directory if *Docker* was installed using *snap*!
That includes the Ansible repro.

Optionally, do this: `sudo usermod -aG docker ${USER}` and then `sudo`
won't be needed to run *Docker* commands. Normal restarting the GUI is required
for it to take affect.

*Full disclosure*, this is the first time the author has used *Docker*,
improvements are welcome.

## Commands for testing the *MythTV Ansible* repro

The following examples are for Ubuntu 24.04. The `tags` below
are in the same distribution:release format as the *Image*s at
[dockerhub](https://hub.docker.com).

Everything below is run from the *Docker Context*.

## Build an *Image*

This command uses instructions in a `distro:version.Dockerfile`. The
`--file` switch is used to replace the default `Dockerfile` and
allows use of the unique file names here.

>`docker build --tag ubuntu:24.04 --file Docker/ubuntu:24.04.Dockerfile .`

If the `build` succeeds, the test is done, this Ansible repro will run on
the selected Linux distribution.

BUT, if . Docker/aliases is typed, then just typing ub24 or fed41 etc.
will run the Dockerfile.

Type: lias|grep kbuild to see a list of known aliases.

## Run an interactive layer

Before reading the below, the aliases read in above can also be
used. Just prepend an 'r' to the above to run what was just
created.

If the above fails, comment out the failing instruction(s) in the
`Dockerfile` and re-run the `build`. Then, run a new session
(`Layer`). Type the failing commands in the shell and figure out
what's wrong. Fix the problem in the `Dockerfile` and/or in the
`Ansible` task(s). For these tests, failures most likely mean that
a package name has changed or is no longer available.

*Docker* only allows `--name`s with alphanumeric characters.

>`docker run --interactive --tty --name ubuntu2004 ubuntu:20.04`

Start a stopped *Container*

If `docker ps -a` shows a *Container* has "Exited", attach to it
as follows:

>`docker start --interactive <CONTAINER ID (from: docker images)>`

## Get the status of all *Container*s

>`docker ps -a`

## List all known *Image*s

>`docker images`

## Dockerfiles here have a `LABEL` instruction, the contents are printable

>`docker inspect ubuntu:24.04 --format='{{json .Config.Labels}}'`

## Clean things up

Delete "Exited" *Container*s, delete dangling *Image*s and active *Image*s.
Delete the `REPOSITORY:TAG` before the `IMAGE ID`. The last two are from
`docker images` output. Use --force to eliminate the prompts.

>`docker container prune [--force]`

>`docker image prune [--force]`

>`docker image rm {REPOSITORY:TAG|IMAGE ID} [--force]`

Alias kprune does all of the above.

## More *Docker* details

The Commad Line Interface and `Dockerfile` details are at
[docker docs](https://docs.docker.com/reference).

## Installing Docker in another partition
If too many images are in play, oom errors are likely to fire.
Relocating Docker to another filesystem prevents that. The
following examples show the changes made:

`sudo systemctl stop docker.{socket,service}`

`$ Change /etc/fstab:`
>`UUID=12345678-1234-1234-1234-0123456789ab /srv/docker ext4 defaults,noatime 0 2`

`sudo mount -a`

`sudo mkdir /srv/docker/data`

`$ Add/change /etc/docker/daemon.json to include:`
>`{`

>`    "data-root": "/srv/docker/data"`

>`}`

`sudo mv /var/lib/docker/* /srv/docker/data`

`sudo systemctl start docker.{socket,service}`
