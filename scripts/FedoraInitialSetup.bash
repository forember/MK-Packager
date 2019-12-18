#!/bin/bash
[ -f /cgroupsv2_disabled ] && exit 0
set -ex
yes | dnf -y upgrade
yes | dnf -y install kernel-devel kernel-headers gcc make perl \
    grubby cloud-utils-growpart e2fsprogs
"/opt/VBoxGuestAdditions-$1/init/vboxadd" stop
"/opt/VBoxGuestAdditions-$1/init/vboxadd" setup
/sbin/rcvboxadd quicksetup all
grubby --update-kernel=ALL --args="systemd.unified_cgroup_hierarchy=0"
touch /cgroupsv2_disabled
set +ex
growpart /dev/sda 2
resize2fs /dev/sda2
cat <<'MSG'


Cgroups V2 have been disabled to allow Docker to work on Fedora.
See https://github.com/docker/cli/issues/297#issuecomment-547022631

IMPORTANT! Please run

    vagrant reload --provision fedora
    
to continue provisioning.

You are about to see an SSH error. This is because the VM is shutting down.
MSG
poweroff
