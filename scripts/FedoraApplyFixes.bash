#!/bin/bash
set -ex
yes | dnf -y remove imsettings blueberry
"/opt/VBoxGuestAdditions-$1/init/vboxadd" stop
"/opt/VBoxGuestAdditions-$1/init/vboxadd" setup
/sbin/rcvboxadd quicksetup all
