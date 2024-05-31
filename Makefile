# gdb-frontend-docker-example, App to tutor using GDBFrontend to debug Dockerized C/C++ apps
# https://github.com/rohanrhu/gdb-frontend-docker-example
# 
# This is a simple program that demonstrates how to use gdb in a docker container
# 
# Copyright (C) 2024, Oğuzhan Eroğlu (https://meowingcat.io) <meowingcate@gmail.com>
# Licensed under MIT license.
#
# This is a simple program that demonstrates how to use gdb in a docker container
# Read the tutorial at https://meowingcat.io/blog/posts/how-to-debug-dockerized-c-cpp-apps-with-gdbfrontend
#
# Happy debugging! 🐾

all:
	gcc -g -o app app.c