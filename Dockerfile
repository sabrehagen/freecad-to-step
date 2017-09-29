FROM ubuntu:16.04

# install supporting tools
RUN apt update && \
    apt install -y software-properties-common wget curl

# install freecad
RUN add-apt-repository ppa:freecad-maintainers/freecad-stable && \
    apt update && \
    apt install -y freecad

# make the data directories
RUN mkdir /input /output

# start the app entrypoint when the container runs
CMD /app/entrypoint.sh
