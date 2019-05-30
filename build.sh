#! /usr/bin/env bash

set -e

QUAY_REPO=quay.io/tessthyer/toil-appliance
SHA=$(git rev-parse HEAD)
SHORT_SHA=${SHA::7}
TAG=$QUAY_REPO:$SHORT_SHA
LATEST_TAG=$QUAY_REPO:latest

echo "Building $TAG."
docker build -t $TAG .

if [[ $? == 0 ]]; then
  docker tag $TAG $LATEST_TAG
  read -n 1 -p "Push new image to quay.io (y/n)? " answer
  if [[ "$answer" == "y" ]]; then
    echo "Pushing $TAG."
    docker push $TAG
    docker push $LATEST_TAG
  fi
fi
