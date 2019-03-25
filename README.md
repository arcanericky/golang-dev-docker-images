# Go Development Docker Images

[![Build Status](https://travis-ci.com/arcanericky/golang-dev-docker-images.svg?branch=master)](https://travis-ci.com/arcanericky/golang-dev-docker-images)
![GitHub release](https://img.shields.io/github/release/arcanericky/golang-dev-docker-images.svg)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

Scripts and Dockerfiles to create Docker images for Go development

## Purpose

Occasionally I have the pleasure of developing software using [Go](https://golang.org/). I usually do this with [Visual Studio Code](https://code.visualstudio.com/), Go, and other tools installed natively. I perform final builds using Go in a [Docker](https://www.docker.com/) container. This is the code used to generate the images I use.

If you're not interested in the source you can use the images by [**pulling them from Docker Hub**](https://hub.docker.com/r/arcanericky/golang-dev).

## Building

Run the `create-images.sh` script to generate Docker images for [Alpine](https://alpinelinux.org/) and [Debian](https://www.debian.org/). This script requires at least one argument which is the base OS of the image. Currently this is limited to `alpine` and `debian`. Both images can be built using the single command:

```
./create-images.sh alpine debian
```

## Using

Run the image and map (or not) your [Go Workspace](https://golang.org/doc/code.html#Workspaces) to your liking. You may need to change your $GOPATH once inside the container or as part of launching it. I'll usually map my home directory to the corresponding home directory in the container.

The Docker commands are long so you'll want to create aliases or scripts to help relieve the CLI pain.

An example of starting an empty container:

```
docker container run --name golang --hostname golang -it --rm golang-dev:debian-latest $USERNAME $(id -u)
```

An example of starting a container with your external home directory mounted. Remember you are mounting your _entire home directory_ into the Docker container. **Danger**: Be careful while in the container because anything you do will be reflected in your external home directory.

```
docker container run --name golang --hostname golang -it --rm -v $HOME:/home/$USERNAME golang-dev:debian-latest $USERNAME $(id -u)
```

A quick way to build a Go executable:

```
mkdir -p $HOME/gotest/go/src/github.com/golang
git clone https://github.com/golang/example.git $HOME/gotest/go/src/github.com/golang/example
docker container run --name golang --hostname golang -it --rm -v $HOME/gotest/go:/go golang-dev:debian-dev $USERNAME $(id -u) "cd /go && go build github.com/golang/example/hello"
./gotest/go/hello
Hello, Go examples!
```