# FreeCad to STEP Converter

This repository contains sketches of a build system that could integrate with Stemn.

# Conventions

Some conventions have been used to form a framework. These will likely need to be expanded in future.

`build/input` contains the input file for the build process.
`build/output` contains the output of the build process.
`build/entrypoint.sh` contains the entrypoint to the build process.

`app` contains the files that will be used as part of the process - scripts, supporting files, inputs etc.

# Running

Run

`./run-build.sh`

Note: the `cube.fcstd` file is mounted into the container to `/build/input` with the `--volume $(pwd)/app/cube.fcstd:/build/input` parameter. This allows the container to expect a single input file location, and the user to mount any file into the container at that location.

# Further Work

There should be a few stages of the build process

1. Prepare - acquire the requisite files from the Stemn API.
2. Build - run the build process (what this container does).
3. Save - upload the build artefact(s) to a server accessible by Stemn.
