# Stemn CI Container

This repository contains a Docker container and associated convention for a build system that could be integrated with Stemn. The one container is intended to be used for each step of the build pipeline.

# Getting Started

Run the `./build-container` script to build the Docker container.

Run the `./run-pipeline.sh` script to run the build pipeline end to end.

The output of the build pipeline will be stored in `freecad/export/output/output.url`.

# Conventions

## Folder Structure

The below conventions have been used to form a framework that should suit all build pipeline stage needs.

### In the container

`/input` contains the input files for the build pipeline stage.
`/output` contains the outputs from the build pipelie stage.
`/app/entrypoint.sh` contains the entrypoint to the build pipeline stage.

The `/app/entrypoint.sh` path is invoked when the container starts. The `/app` folder can contain any other scripts needed by the pipeline stage.

The `input` and `output` directories can contain anything. Each stage of the build pipeline can rely on its requisite inputs to be contained in `/input` and will store its pipeline stage outputs in `/output`.

The `app` directory contains the files to be used in the pipeline stage, conventionally invoked by `/entrypoint.sh`.

### In the project directory

The name of the provider that this build pipeline is built for is at the root directory, in this case `freecad`.

Within each provider directory there are the build stages, in this case `prepare`, `build`, `export`.

Within each build stage directory there are `input` and `output` directories which are used as inputs and outputs to each stage respectively. There is also an `app` directory which contains the `entrypoint.sh` and files used as part of the build stage.

Some directories are symlinked as they are logically the same folder, for example, `prepare/output => build/input`, `build/output => export/input`.

# Build Pipeline

The build process is broken into stages, which are composed in sequence into the build pipeline. By conforming to the convention above, each build stage of the build pipeline can use the same container design.

This pipeline uses the stages:

1. Prepare - acquire the requisite files from the Stemn API.
2. Build - run the build process (what this container does).
3. Export - upload the build artefact(s) to a server accessible by Stemn.
