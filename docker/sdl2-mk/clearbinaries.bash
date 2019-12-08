#!/bin/bash
set -ex
cd /packager
rm -r binaries
mkdir binaries
cd binaries
mkdir automake sdl2-mk sdl2-mk-dev