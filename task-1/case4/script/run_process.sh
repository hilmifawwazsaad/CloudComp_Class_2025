#!/bin/bash
docker rm -f myprocess1

# Get absolute path of script directory
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

docker container run \
	--name myprocess1 \
	-dit \
	-e DELAY=8 \
	--link mysql1 \
	-v "$SCRIPT_DIR":/script \
	alpine:3.18 \
	/bin/sh /script/getjokes.sh

