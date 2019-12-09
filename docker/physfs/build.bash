#!/bin/bash
set -ex
/packager/clearbinaries.bash
function build {
    cd "/packager/build/$1"
    ( [ -f Makefile ] && make clean ) || true
    if [ "$NOPACKAGE" = 0 ]; then
        prefix=/usr
        libsuffix="/x86_64-linux-gnu"
    else
        prefix=/packager/binaries/physfs
        libsuffix=''
    fi
    cmake -DCMAKE_INSTALL_PREFIX="$prefix" -DLIB_SUFFIX="$libsuffix" \
        "/packager/sources/$1"
    make -j4
    make install
}
build physfs
