# FreeCad to STEP Converter

This repository contains sketches of a build system that could integrate with Stemn.

# Conventions

The below conventions have been used to form a framework that should suit all build pipeline step needs.

Within the container:

`/input` contains the input files for the build pipeline stage.
`/output` contains the outputs from the build pipelie stage.
`/app/entrypoint.sh` contains the entrypoint to the build pipeline stage.

The `/app/entrypoint.sh` path will be invoked when the container starts. The `/app` folder can contain any other scripts needed by the pipeline stage.

The `input` and `output` directories can contain anything. Each stage of the build pipeline can rely on its requisite inputs to be contained in `/input` and will store its pipeline stage outputs in `/output`.

The `app` directory contains the files to be used in the pipeline stage, conventionally invoked by `/entrypoint.sh`.

# Running

`./run-pipeline.sh`

Note: the `cube.fcstd` file is mounted into the container to `/input/input.fcstd` with the `--volume $(pwd)/app/cube.fcstd:/input/input.fcstd` parameter. This is an example of how to supply input files to the container.

# Further Work

## Pipeline

The build process should be broken into stages, each served by a different container, and each conforming to a common API e.g. the convention used above. This allows the use of one container design for each stage of the build pipeline.

1. Prepare - acquire the requisite files from the Stemn API.
2. Build - run the build process (what this container does).
3. Export - upload the build artefact(s) to a server accessible by Stemn.

## Build Runner

A build runner will be created that sequences the three stages above.
