#!/bin/bash

# run an interactive container -i with stdout on a pseudo tty -t
# using the muelu-tutorial image and a bash shell
# NOTE: this will create a new container every time. use start-container.sh after you've used this once
docker run -i -t muelu-tutorial /bin/bash
