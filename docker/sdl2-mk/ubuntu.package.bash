#!/bin/bash
set -e
/packager/clearbinaries.bash
timestamp="$(date +%s)"
function makedeb {
    cd "/packager/binaries/$1"
    while read file; do
        mkdir -p "usr/$(dirname "$file")"
        cp "/usr/$file" "usr/$file"
    done <"/packager/$1.txt"
    mkdir DEBIAN
    sed "s/TIMESTAMP/$timestamp/g" <"/packager/$1.debctl" >DEBIAN/control
    cd ..
    dpkg-deb -b "$1" /packager/output
}
makedeb automake
makedeb sdl2-mk
makedeb sdl2-mk-dev
