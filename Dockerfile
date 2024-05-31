# gdb-frontend-docker-example, App to tutor using GDBFrontend to debug Dockerized C/C++ apps
# https://github.com/rohanrhu/gdb-frontend-docker-example
# 
# This is a simple program that demonstrates how to use gdb in a docker container
# 
# Copyright (C) 2024, Oğuzhan Eroğlu (https://meowingcat.io) <meowingcate@gmail.com>
# Licensed under MIT license.
#
# This is a simple program that demonstrates how to use gdb in a docker container
# Read the tutorial at https://meowingcat.io/blog/posts/how-to-debug-dockerized-c-cpp-apps-with-gdbfrontend
#
# Happy debugging! 🐾

FROM debian:bookworm

EXPOSE 5550:5550

ARG GDBFRONTEND_BIND_ADDRESS=0.0.0.0

COPY . /root/gdb-frontend-docker-example

RUN printf "deb http://httpredir.debian.org/debian bullseye-backports main non-free\ndeb-src http://httpredir.debian.org/debian bullseye-backports main non-free" > /etc/apt/sources.list.d/backports.list

RUN apt update -y && \
    apt upgrade -y && \
    apt install -y git \
                   gcc \
                   build-essential \
                   make \
                   gdb \
                   tmux \
                   procps \
                   python3 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /root
RUN git clone https://github.com/rohanrhu/gdb-frontend.git

WORKDIR /root/gdb-frontend-docker-example

RUN echo "set auto-load safe-path /" > ~/.gdbinit

CMD /root/gdb-frontend/gdbfrontend -w /root/gdb-frontend-docker-example -l "$GDBFRONTEND_BIND_ADDRESS"