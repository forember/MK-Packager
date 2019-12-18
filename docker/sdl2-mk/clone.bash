#!/bin/bash
set -ex
cd /packager
mkdir binaries build sources
cd sources
wget -q https://ftp.gnu.org/gnu/automake/automake-1.16.tar.xz
tar xf automake-1.16.tar.xz
mv automake-1.16 automake
git clone https://git.code.sf.net/p/mikmod/mikmod mikmod
printf 'Cloning SDL repos takes a while\n'
hg clone https://hg.libsdl.org/SDL SDL
git clone https://github.com/x42/weakjack.git weakjack
/packager/modsdl.bash
hg clone https://hg.libsdl.org/SDL_image SDL_image
hg clone https://hg.libsdl.org/SDL_ttf SDL_ttf
git clone https://github.com/Ancurio/SDL_sound.git SDL_sound
/packager/bootstrap.bash
cd ../build
mkdir automake mikmod SDL SDL_image SDL_ttf SDL_sound
mkdir mikmod/libmikmod mikmod/mikmod
/packager/clearbinaries.bash
