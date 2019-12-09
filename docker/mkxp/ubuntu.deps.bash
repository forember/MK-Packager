#!/bin/bash
set -ex
/packager/ubuntu.upgrade.bash
apt-get -y install git build-essential gdebi xxd
apt-get -y install ruby2.5-dev libsigc++-2.0-dev libopenal-dev libvorbis-dev \
    libpixman-1-dev zlib1g-dev libgl1-mesa-dev libguess-dev libfluidsynth-dev \
    libboost1.65-dev libboost-program-options1.65-dev
