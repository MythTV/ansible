#!/usr/bin/env -S retext --preview

[//]: # (Install retext from your distribution then ./README.md will look prettier.)

## Introduction

This was developed/tested on an Ubuntu 22.04 host running *Docker* version
20.10.17.  N.B. The *Docker Context* (the directory above this README.md)
**MUST BE** in your $HOME directory if *Docker* was installed using snap!
That includes the Ansible repro.

Optionally, do this: ```sudo usermod -aG docker ${USER}``` and then ```sudo```
won't be needed to run *Docker* commands. Normal restarting the GUI is required
for it to take affect.

*Full disclosure*, this is the first time the author has used *Docker*,
improvements are welcome.

## Commands for testing the MythTV Ansible repro

The following examples are for Ubuntu 20.04. The ```tags``` below
are in the same distribution:release format as the *Image*s at
[dockerhub](https://hub.docker.com).

Everything below is run from the *Docker Context*.

## Build an *Image*

This command uses instructions in a ```distro:version.Dockerfile```. The
```--file``` switch is used to replace the default ```Dockerfile``` and
allows use of the unique file names here.

&nbsp;&nbsp;&nbsp;```docker build --tag ubuntu:20.04 --file Docker/ubuntu:20.04.Dockerfile .```

If the ```build``` succeeds, the test is done, this Ansible repro will run on
the selected Linux distribution.

## Run an interactive layer

If the above fails, commenting out the instruction(s) in the ```Dockerfile```
that fail and re-run the ```build```. Then, run a new session (```Layer```)
in a new . Type the failing commands manually in the shell. For these tests,
failures most likely mean that a package name has changed or is no longer
available.

*Docker* only allows ```--name```s with alphanumeric characters.

&nbsp;&nbsp;&nbsp;```docker run --interactive --tty --name ubuntu2004 ubuntu:20.04```

Start a stopped *Container*

If ```docker ps -a``` shows a *Container* has "Exited", attach to it
as follows:

&nbsp;&nbsp;&nbsp;```docker container start --attach --interactive ubuntu:20.04```

## Get the status of all *Container*s

&nbsp;&nbsp;&nbsp;```docker ps -a```

## List all known *Image*s

&nbsp;&nbsp;&nbsp;```docker images```

## Clean things up

Delete "Exited" *Container*s, delete dangling *Image*s and active *Image*s.
Delete the ```REPOSITORY:TAG``` before the ```IMAGE ID```. The last two are from
```docker images``` output. Use --force to eliminate the prompts.

&nbsp;&nbsp;&nbsp;```docker container prune [--force]```

&nbsp;&nbsp;&nbsp;```docker image prune [--force]```

&nbsp;&nbsp;&nbsp;```docker image ```IMAGE ID``` ubuntu:20.04 [--force]```

## More *Docker* details

the Commad Line Interface and ```Dockerfile``` details are at
[docker docs](https://docs.docker.com/reference).
