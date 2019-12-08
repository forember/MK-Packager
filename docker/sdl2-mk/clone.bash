#!/bin/bash
set -ex
cd /packager
mkdir binaries build sources
cd sources
wget -q https://ftp.gnu.org/gnu/automake/automake-1.16.tar.xz
tar xf automake-1.16.tar.xz
mv automake-1.16 automake
printf 'Cloning mercurial repos takes a while\n'
hg clone https://hg.libsdl.org/SDL SDL
/packager/video.bash
hg clone https://hg.libsdl.org/SDL_image SDL_image
hg clone https://hg.libsdl.org/SDL_ttf SDL_ttf
git clone https://github.com/Ancurio/SDL_sound.git SDL_sound
cd SDL_sound
./bootstrap
cd ../../build
mkdir automake SDL SDL_image SDL_ttf SDL_sound
/packager/clearbinaries.bash