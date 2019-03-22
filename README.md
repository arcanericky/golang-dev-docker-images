# Go Development Docker Images

[![Build Status](https://travis-ci.com/arcanericky/golang-dev-docker-images.svg?branch=master)](https://travis-ci.com/arcanericky/golang-dev-docker-images)
![GitHub release](https://img.shields.io/github/release/arcanericky/golang-dev-docker-images.svg)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

Scripts and Dockerfiles to create Docker images for Go development

## Purpose

Occasionally I have the pleasure of developing software using [Go](https://golang.org/). I usually do this with [Visual Studio Code](https://code.visualstudio.com/), Go, and other tools installed natively. I perform final builds using Go in a [Docker](https://www.docker.com/) container. These are the images I use.

## Building

Run the `create-images.sh` script to generate Docker images for [Alpine](https://alpinelinux.org/) and [Debian](https://www.debian.org/). This script requires at least one argument which is the base OS of the image. Currently this is limited to `alpine` and `debian`. Both images can be built using the single command:

```
./create-images.sh alpine debian
```

## Using

Run the image and map (or not) your [Go Workspace](https://golang.org/doc/code.html#Workspaces) to your liking. You may need to change your $GOPATH once inside the container or as part of launching it. I'll usually map my home directory to the corresponding home directory in the container.

An example of starting an empty container:

```
docker container run --name golang --hostname golang -it --rm golang-dev:debian-latest $USERNAME $(id -u)
```

An example of starting a container with your external home directory mounted.

```
docker container run --name golang --hostname golang -it --rm -v $HOME:/home/$USERNAME golang-dev:debian-latest $USERNAME $(id -u)
```