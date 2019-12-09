#!/bin/bash
set -ex
/packager/ubuntu.upgrade.bash
apt-get -y install git mercurial build-essential autoconf automake make \
    wget libtool
