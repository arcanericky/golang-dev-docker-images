#!/bin/sh

for IMAGE in $(docker images --format '{{.Repository}}:{{.Tag}}' golang-dev:*)
do
  echo Pushing $IMAGE
  REGISTRYTAG="arcanericky/$IMAGE"
  docker tag $IMAGE $REGISTRYTAG
  docker push $REGISTRYTAG
done
