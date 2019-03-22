# Go Development Docker Images

[![Build Status](https://travis-ci.com/arcanericky/golang-dev-docker-images.svg?branch=master)](https://travis-ci.com/arcanericky/golang-dev-docker-images)

Scripts and Dockerfiles to create Docker images for Go development

## Purpose

Occasionally I have the pleasure of developing software using [Go](https://golang.org/). I usually do this with [Visual Studio Code](https://code.visualstudio.com/), Go, and other tools installed natively. I perform final builds using Go in a [Docker](https://www.docker.com/) container. These are the images I use.

## Building

Run the `create-images.sh` script to generate Docker images for [Alpine](https://alpinelinux.org/) and [Debian](https://www.debian.org/). The script will automatically grab your user name and user ID then generate a corresponding user in the Docker image. This is useful to ensure files created in the container and mapped to the local filesystem contain your user ownership.

## Using

Run the image and map your [Go Workspace](https://golang.org/doc/code.html#Workspaces) to your liking. You may need to change your $GOPATH once inside the image or as part of launching the image. I'll usually map my home directory to the corresponding home directory in the container.

```
docker container run --name golang --hostname golang -it --rm -v $HOME:/home/myusername golang:debian
```