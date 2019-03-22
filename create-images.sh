#!/bin/bash

BUILDER () {
  case "$1" in
  "alpine")
    NAME="alpine"
    ;;
  "debian")
    NAME="debian"
    ;;
  *)
    echo "Unsupported build type: $1. Options are \"alpine\" and \"debian\""
    return
    ;;
  esac

  TAG="golang:${NAME}"
  FILE="Dockerfile-${NAME}"

  docker build \
    --tag "$TAG" \
    --file "$FILE" .
}

for IMAGE in "$@"
do
  echo "Building for $IMAGE"
  BUILDER "$IMAGE"
done