#!/bin/bash
set -ex
/packager/ubuntu.upgrade.bash
apt-get -y install mercurial build-essential cmake
apt-get -y install libreadline-dev
apt-get -y install zlib1g-dev libncurses5-dev
