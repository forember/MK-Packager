#!/bin/bash
set -ex
function build {
    cd "/packager/build/$1"
    ( [ -f Makefile ] && make clean ) || true
    if [ "$NOPACKAGE" = 0 ]; then
        prefix=/usr
        libprefix="$prefix/lib/x86_64-linux-gnu"
    elif [ "$1" = automake ]; then
        prefix=/packager/binaries/automake
        libprefix="$prefix/lib"
    else
        prefix=/packager/binaries/sdl2-mk
        libprefix="$prefix/lib"
    fi
    "/packager/sources/$1/configure" --prefix "$prefix" --libprefix "$libprefix"
    make -j4
    make install
}
build automake
[ "$NOPACKAGE" = 0 ] || export PATH="/packager/binaries/automake/bin:$PATH"
build SDL
build SDL_image
build SDL_ttf
build SDL_sound