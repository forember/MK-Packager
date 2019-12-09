#!/bin/bash
set -ex
cd /packager
./ubuntu.mkdeps.bash
./pull.bash
./build.bash
if [ "$NOPACKAGE" = 0 ]; then
    ./ubuntu.package.bash
else
    find /packager/binaries | sort
fi
