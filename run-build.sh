#!/bin/bash

# display output on the terminal
# mount all files in the build directory to the container
# mount the file to be converted to the build input location

docker run \
  --tty \
  --volume $(pwd)/build:/build \
  --volume $(pwd)/app/cube.fcstd:/build/input \
  freecad-ci
