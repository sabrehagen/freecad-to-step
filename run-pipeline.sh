#!/bin/bash

# display output on the terminal
# mount all files in each pipeline stage to the container

docker run \
  --tty \
  --volume $(pwd)/$(stage)}/input:/input \
  --volume $(pwd)/$(stage)}/output:/output \
  --volume $(pwd)/$(stage)}/app:/app \
  stemn-ci
