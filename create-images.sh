#!/bin/sh

USER=$(whoami)
UID=$(id -u)

docker build \
  --build-arg USERNAME=$USER \
  --build-arg UID=$UID \
  --tag golang:alpine \
  --file Dockerfile-alpine .

docker build \
  --build-arg USERNAME=$USER \
  --build-arg UID=$UID \
  --tag golang:debian \
  --file Dockerfile-debian .
