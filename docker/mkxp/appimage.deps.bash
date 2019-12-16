#!/bin/bash
set -ex
/packager/ubuntu.upgrade.bash
apt-get -y install git build-essential wget file desktop-file-utils \
    libglib2.0-bin
