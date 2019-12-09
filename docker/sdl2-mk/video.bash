#!/bin/bash
set -ex
sed -Ei \
    '/^#define CREATE_FLAGS \\\s*$/{n;s/^(\s*)\((.*)\)\s*$/\1(SDL_WINDOW_INPUT_FOCUS | \2)/}' \
    /packager/sources/SDL/src/video/SDL_video.c
