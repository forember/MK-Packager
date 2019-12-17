#!/bin/bash
[ -f /cgroupsv2_disabled ] && exit 0
set -e
yes | dnf -y install grubby
grubby --update-kernel=ALL --args="systemd.unified_cgroup_hierarchy=0"
touch /cgroupsv2_disabled
cat <<'MSG'


Cgroups V2 have been disabled to allow Docker to work on Fedora.
See https://github.com/docker/cli/issues/297#issuecomment-547022631

IMPORTANT! Please run

    vagrant reload --provision fedora
    
to continue provisioning.

You are about to see an SSH error. This is because the VM is shutting down.
MSG
poweroff
