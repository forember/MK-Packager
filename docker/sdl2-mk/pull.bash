#!/bin/bash
set -ex
cd /packager/sources/SDL
hg revert --no-backup src/video/SDL_video.c
hg pull
/packager/video.bash
cd ../SDL_image
hg pull
cd ../SDL_ttf
hg pull
cd ../SDL_sound
git reset --hard HEAD
git pull
./bootstrap
