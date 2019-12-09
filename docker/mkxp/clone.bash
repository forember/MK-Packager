#!/bin/bash
set -ex
cd /packager
mkdir binaries build sources
cd sources
git clone https://github.com/NighttimeDriver50000/mkxp.git mkxp
cd ../build
mkdir mkxp
/packager/clearbinaries.bash
