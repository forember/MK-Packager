#!/bin/bash
set -ex
cd /packager/sources/SDL
./autogen.sh
cd ../SDL_image
./autogen.sh
cd ../SDL_ttf
./autogen.sh
cd ../SDL_sound
./bootstrap
cp bootstrap ../mikmod/mikmod/
cp bootstrap ../mikmod/libmikmod/
cd ../mikmod/mikmod
./bootstrap
cd ../libmikmod
./bootstrap
