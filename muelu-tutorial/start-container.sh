#!/bin/bash

# grab the id for the last container that was run
# NOTE: hardcode this variable if you frequently run containers for other images
CONTAINER_ID=$(docker ps -l | head -n 2 | tail -n 1 | tr " " "\n" | head -n 1)

# run an interactive container -i with stdout on a pseudo tty -t
# using the muelu-tutorial image and a bash shell
docker start -i -a ${CONTAINER_ID}
