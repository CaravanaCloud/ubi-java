#!/bin/bash
set -ex

# Java 21 on Fedora 39
TAG="caravanacloud/ubi-java:J21F39"
# TAG=${TAG:-"caravanacloud/ubi-java:latest"}

echo "Building $TAG"

docker build -f Containerfile \
    --no-cache \
    --progress=plain \
    -t "$TAG" \
    .

docker push "$TAG"
