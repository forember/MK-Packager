#!/bin/bash
set -ex
/packager/clearbinaries.bash
function build {
    src="$1"
    shift
    cd "/packager/build/$src"
    ( [ -f Makefile ] && make clean ) || true
    if [ "$NOPACKAGE" = 0 ]; then
        prefix=/usr/optional
        libdir="$prefix/lib/x86_64-linux-gnu"
    else
        prefix=/packager/binaries/jackd2-optional
        libdir="$prefix/lib"
    fi
    export WAFDIR="/packager/sources/$src"
    "$WAFDIR/waf" configure --out . --top "$WAFDIR" \
        --prefix "$prefix" --libdir "$libdir" "$@"
    "$WAFDIR/waf" -j4
    "$WAFDIR/waf" install
}
build jack2
