#!/usr/bin/env bash
set -e
IMAGE=${1:-trend-app:latest}
CONTAINER=trend-app
docker pull "$IMAGE" || true
docker rm -f $CONTAINER || true
docker run -d --name $CONTAINER -p 3000:3000 --restart unless-stopped "$IMAGE"
