#!/bin/bash
set -ex
cd /packager/sources/SDL
sed -Ei \
    '/^#define CREATE_FLAGS \\\s*$/{n;s/^(\s*)\((.*)\)\s*$/\1(SDL_WINDOW_INPUT_FOCUS | \2)/}' \
    src/video/SDL_video.c
cp ../weakjack/weak_libjack.c src/
cp ../weakjack/weak_libjack.{def,h} include/
sed -Ei \
    's/^#include [<"]jack\/jack.h[">]\s*$/#include "weak_libjack.h"/' \
    src/audio/jack/SDL_jackaudio.h
