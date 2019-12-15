#!/bin/bash
if [ "$USER" != root ]; then
    printf 'This script must be run as root\n'
    exit 1
fi
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 0xC926F70CE8ED4037
sh -c 'echo "deb https://mk.mckinney.click/ubuntu/ ./" >/etc/apt/sources.list.d/mk-mckinney.list'
apt update
apt install mkxp
