#!/bin/bash
set -ex
cd /packager
mkdir binaries build sources
cd sources
git clone https://github.com/jackaudio/jack2.git jack2
cd ../build
mkdir jack2
/packager/clearbinaries.bash
