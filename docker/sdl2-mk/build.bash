#!/bin/bash
set -ex
/packager/clearbinaries.bash
function build {
    src="$1"
    shift
    cd "/packager/build/$src"
    ( [ -f Makefile ] && make clean ) || true
    if [ "$NOPACKAGE" = 0 ]; then
        prefix=/usr
        libdir="$prefix/lib/x86_64-linux-gnu"
    elif [ "$src" = automake ]; then
        prefix=/packager/binaries/automake
        libdir="$prefix/lib"
    elif [ "$src" = mikmod/libmikmod ] || [ "$src" = mikmod/mikmod ]; then
        prefix=/packager/binaries/mikmod-git
        libdir="$prefix/lib"
    else
        prefix=/packager/binaries/sdl2-mk
        libdir="$prefix/lib"
    fi
    "/packager/sources/$src/configure" \
        --prefix "$prefix" --libdir "$libdir" "$@"
    make -j4
    make install
}
build automake
[ "$NOPACKAGE" = 0 ] || export PATH="/packager/binaries/automake/bin:$PATH"
build mikmod/libmikmod
[ "$NOPACKAGE" = 0 ] || export PATH="/packager/binaries/mikmod-git/bin:$PATH"
[ "$NOPACKAGE" = 0 ] || export LD_LIBRARY_PATH='/packager/binaries/mikmod-git/lib'
build mikmod/mikmod
build SDL --disable-jack
build SDL_image
build SDL_ttf
build SDL_sound
