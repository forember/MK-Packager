#!/bin/bash
set -ex
/packager/ubuntu.upgrade.bash
apt-get -y install libc6-dev libopenal-dev libpulse-dev
apt-get -y install texinfo libncurses5-dev libtinfo-dev oss-compat
apt-get -y install libfreetype6-dev libjpeg-dev libpng-dev libtiff-dev \
    libvorbis-dev libwebp-dev zlib1g-dev
apt-get -y install libasound2-dev libpulse-dev libaudio-dev libx11-dev \
    libxext-dev libxrandr-dev libxcursor-dev libxi-dev libxinerama-dev \
    libxxf86vm-dev libxss-dev libgl1-mesa-dev libdbus-1-dev libudev-dev \
    libgles2-mesa-dev libegl1-mesa-dev libibus-1.0-dev fcitx-libs-dev \
    libsamplerate0-dev libsndio-dev libwayland-dev libxkbcommon-dev \
    wayland-protocols
apt-get -y install libc6-dev libflac-dev libogg-dev libxv-dev \
    libsdl1.2-dev libspeex-dev libglu1-mesa-dev libmirclient-dev libxt-dev
