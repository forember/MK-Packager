#!/bin/bash
set -ex
cd /packager
mkdir binaries build sources
cd sources
hg clone https://hg.icculus.org/icculus/physfs physfs
cd ../build
mkdir physfs
/packager/clearbinaries.bash
