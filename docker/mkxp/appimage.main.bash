#!/bin/bash
set -ex
/packager/appimage.pull.bash
/packager/appimage.repo.bash
cd /packager/pkg2appimage
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 24A5F4FED4B4972B
bash -ex pkg2appimage recipes/mkxp.yml
cp out/*.AppImage /packager/output/
