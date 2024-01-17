#!/bin/bash
set -ex

echo "Building Java Runtime UBI"
docker build -f Containerfile --no-cache --progress=plain -t registry-1.docker.io/caravanacloud/ubi-java:21 .
docker push registry-1.docker.io/caravanacloud/ubi-java:21

echo "Building Java Build UBI"
docker build -f Containerfile.build --no-cache --progress=plain -t registry-1.docker.io/caravanacloud/ubi-java:21-build .
docker push registry-1.docker.io/caravanacloud/ubi-java:21-build

echo "done."
