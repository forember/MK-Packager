#!/bin/bash
set -e
/packager/clearbinaries.bash
timestamp="$(date +%s)"
cd /packager/binaries/mkxp
mkdir -p usr/bin usr/share/icons/hicolor/128x128/{apps,mimetypes} \
    usr/share/applications usr/share/mime/packages
cp /packager/build/mkxp/mkxp usr/bin/
cp /packager/mkxp-launch usr/bin/
chmod +x usr/bin/mkxp-launch
cp /packager/mkxp.png usr/share/icons/hicolor/128x128/apps/
cp /packager/mkxp.png usr/share/icons/hicolor/128x128/mimetypes/application-x-mk-project.png
cp /packager/mkxp.desktop usr/share/applications/
cp /packager/mkxp.xml usr/share/mime/packages/
cp /packager/
mkdir DEBIAN
sed "s/TIMESTAMP/$timestamp/g" </packager/mkxp.debctl >DEBIAN/control
cd ..
dpkg-deb -b mkxp /packager/output
