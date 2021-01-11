#!/bin/bash

docker stop dogecoind
docker rm dogecoind

docker pull timchurchard/docker-dogecoin:1.14.2
docker image prune -f

docker create \
    --name dogecoind \
    -p 127.0.0.1:22556:22556 \
    -p 22555:22555 \
    -v /path/to/dogecoind_data:/data \
    timchurchard/docker-dogecoin:1.14.2

# Don't restart plex on boot because encrypted drives not mounted!
docker update --restart=no dogecoind

docker start dogecoind

