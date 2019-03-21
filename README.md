# Go Development Docker Images

[![Build Status](https://travis-ci.com/arcanericky/golang-dev-docker-images.svg?branch=master)](https://travis-ci.com/arcanericky/golang-dev-docker-images)

Scripts and Dockerfiles for creating Docker images for Go development

## Purpose

Occasionally I have the pleasure of developing software using Go. I usually do this with Visual Studio Code, Go, and other tools installed natively. I perform final builds using Go in a Docker container. These are the images I use.

## Building

Simply run the `create-images.sh` script to generate Docker images for Alpine and Debian. The script will automatically grab your user name and user ID then generate a corresponding user in the Docker image. This is useful to ensure files created in the container but are mapped to the local filesystem contain your user permissions.

## Using

Run the image and map your Go Workspace to your liking. You may need to change your $GOPATH once inside the image or as part of launching the image. I'll usually just map my home directory to the corresponding home directory in the container.

```
docker container run --name golang --hostname golang -it --rm -v $HOME:/home/myusername golang:debian
```