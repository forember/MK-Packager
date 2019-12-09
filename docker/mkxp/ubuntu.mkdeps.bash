#!/bin/bash
set -ex
cd /packager/output
../ubuntu.upgrade.bash
function latest {
    find . -print0 \
        | sed -znE "/$1/{s/$1/\\1/;p}" \
        | sort -zn \
        | tail -zn 1 \
        | tr '\0' '\n'
}
mikmod_build="$(latest '^\.\/mikmod-git_3\.3\.11\.2-1git([0-9]+)_amd64\.deb')"
sdl2_build="$(latest '^\.\/sdl2-mk-dev_2\.0\.10-1mk([0-9]+)_amd64\.deb$')"
physfs_build="$(latest '^\.\/physfs-dev_3\.0\.2-1hg([0-9]+)_amd64\.deb$')"
[ "$sdl2_build" ] && [ "$physfs_build" ]
gdebi -n "libmikmod-git_3.3.11.2-1git${mikmod_build}_amd64.deb"
gdebi -n "libmikmod-git-config_3.3.11.2-1git${mikmod_build}_amd64.deb"
gdebi -n "libmikmod-git-dev_3.3.11.2-1git${mikmod_build}_amd64.deb"
gdebi -n "sdl2-mk_2.0.10-1mk${sdl2_build}_amd64.deb"
gdebi -n "sdl2-mk-dev_2.0.10-1mk${sdl2_build}_amd64.deb"
gdebi -n "physfs_3.0.2-1hg${physfs_build}_amd64.deb"
gdebi -n "physfs-dev_3.0.2-1hg${physfs_build}_amd64.deb"
