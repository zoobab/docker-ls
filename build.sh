#!/bin/bash
WORKDIR="`mktemp -d`"
docker build -v $WORKDIR:/usr/local/bin/ -t dockerls:latest .
cp -v $WORKDIR/docker-ls ./bin
cp -v $WORKDIR/docker-rm .
