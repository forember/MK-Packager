#!/bin/bash
set -ex
cd /packager
rm -r binaries
mkdir binaries
cd binaries
mkdir automake libmikmod-git libmikmod-git-config libmikmod-git-dev mikmod-git \
    sdl2-mk sdl2-mk-dev
