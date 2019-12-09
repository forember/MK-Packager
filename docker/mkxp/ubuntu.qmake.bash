#!/bin/bash
set -ex
/packager/ubuntu.upgrade.bash
apt-get -y install qt5-qmake qt5-default
