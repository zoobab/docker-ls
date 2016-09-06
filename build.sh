#!/bin/bash
WORKDIR="$PWD/bin"
docker build -t dockerls:latest .
docker run -v $WORKDIR:/mnt dockerls:latest cp -v /usr/local/bin/{docker-rm,docker-ls} /mnt
