# FreeCad to STEP Converter

This repository contains sketches of a build system that could integrate with Stemn.

# Conventions

Some conventions have been used to form a framework. These will likely need to be expanded in future.

`build/input` contains the input file for the build process.
`build/output` contains the output of the build process.
`build/entrypoint.sh` contains the entrypoint to the build process.

`app` contains the files that will be used as part of the process - scripts, supporting files, inputs etc.

# Running

`./run-build.sh`

Note: thee `cube.fcstd` file is mounted into the container to `/build/input` with the `--volume $(pwd)/app/cube.fcstd:/build/input` parameter. This allows the container to expect a single input file location, and the user to mount any file into the container at that location.

