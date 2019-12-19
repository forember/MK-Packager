#!/bin/bash
set -ex
/packager/ubuntu.upgrade.bash
apt-get -y install git build-essential python3 pkg-config \
    libc6-dev libsamplerate0-dev libgcc1 libstdc++6
apt-get -y install libffado-dev coreutils libasound2-dev libdbus-1-dev \
    libexpat1-dev libreadline-dev libsndfile1-dev python3-dbus
