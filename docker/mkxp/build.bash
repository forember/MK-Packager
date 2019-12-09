#!/bin/bash
set -ex
/packager/clearbinaries.bash
function build {
    cd "/packager/build/$1"
    ( [ -f Makefile ] && make clean ) || true
    if [ "$NOPACKAGE" = 0 ]; then
        export INSTALL_ROOT="/packager/build/$1"
    else
        export INSTALL_ROOT="/packager/binaries/$1"
    fi
    cp -a "/packager/sources/$1"/* ./
    cp -a "/packager/sources/$1"/* ./
    qmake "$1.pro" BINDING=MRI MRIVERSION=2.5 \
        CONFIG+=INI_ENCODING CONFIG+=SHARED_FLUID DEFINES+=WORKDIR_CURRENT
    make -j4
    #make install
}
build mkxp
