FROM ubuntu:16.04

RUN apt update && \
    apt install -y software-properties-common

RUN add-apt-repository ppa:freecad-maintainers/freecad-stable && \
    apt update && \
    apt install -y freecad

ADD build build
ADD app app

CMD /build/entrypoint.sh
