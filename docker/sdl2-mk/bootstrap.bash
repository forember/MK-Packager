#!/bin/bash
set -ex
cd /packager/sources/SDL_sound
./bootstrap
cp bootstrap ../mikmod/libmikmod/
cp bootstrap ../mikmod/mikmod/
cd ../mikmod/libmikmod
./bootstrap
cd ../mikmod
./bootstrap
