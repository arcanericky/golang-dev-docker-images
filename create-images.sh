#!/bin/bash

BUILDER () {
  case "$1" in
  "linux")
    NAME="linux"
    ;;
  *)
    echo "Unsupported build type: $1. Options are \"linux\""
    return
    ;;
  esac

  VERSION=$(git tag --points-at HEAD | head -1)
  if [ "$VERSION" = "" ]; then
    VERSION="dev"
  fi

  TAG="golang-dev:${NAME}-${VERSION}"
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