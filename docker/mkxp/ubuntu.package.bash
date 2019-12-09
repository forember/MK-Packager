#!/bin/bash
set -e
/packager/clearbinaries.bash
timestamp="$(date +%s)"
function makedeb {
    cd "/packager/binaries/$1"
    while read file; do
        mkdir -p "usr/bin/$(dirname "$file")"
        cp "/packager/build/$1/$file" "usr/bin/$file"
    done <"/packager/$1.txt"
    mkdir DEBIAN
    sed "s/TIMESTAMP/$timestamp/g" <"/packager/$1.debctl" >DEBIAN/control
    cd ..
    dpkg-deb -b "$1" /packager/output
}
makedeb mkxp
