#!/bin/bash
set -ex
cd /packager/pkg2appimage
git reset --hard HEAD
git pull
cp /packager/mkxp.yml recipes/
sed -Ei 's/ \| grep -e "\^http"//' pkg2appimage
