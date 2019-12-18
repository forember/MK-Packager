#!/bin/bash
set -ex
cd /packager/sources/mikmod
git reset --hard HEAD
git pull
cd ../SDL
hg revert --no-backup src/video/SDL_video.c
hg pull
hg update
cd ../weakjack
git pull
/packager/modsdl.bash
cd ../SDL_image
hg pull
hg update
cd ../SDL_ttf
hg pull
hg update
cd ../SDL_sound
git reset --hard HEAD
git pull
/packager/bootstrap.bash
