#!/bin/bash

set -x

provider=freecad
stages=( "prepare" "build" "export" )

for stage in "${stages[@]}"
do
  docker run \
    --tty \
    --volume $(pwd)/$provider/$stage/input:/input \
    --volume $(pwd)/$provider/$stage/output:/output \
    --volume $(pwd)/$provider/$stage/app:/app \
    stemn-ci
done

