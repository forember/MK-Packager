# MK-Packager

[Vagrant][] and [Docker][] configurations for developing and packaging
installers for the Marin-MK RPG tools ([mkxp][] for [MK-Starter-Kit][], and
[MK-Editor][] with its dependencies [odl][] and [SDL2-CS][]). Currently only
debug builds are supported. Release builds will be added once MK-Editor comes
out of alpha.

## Quick Start

First, [install Vagrant][], the [latest VirtualBox][], and [git][]. MK-Packager
does not require the VirtualBox extension pack. Now, open PowerShell or bash,
and `cd` into the folder you want to put MK-Packager. Run the following to
retrieve the project and create the Linux VM (I apologize for my stupid
username):

```sh
git clone https://github.com/NighttimeDriver50000/MK-Packager.git
git submodule update --recursive --init
cd MK-Packager
vagrant up linux
```

You can also run `vagrant up windows` to create the Windows VM (*Note:* the
Windows VM can currently be created, but it doesn't do anything yet).

VirtualBox will open, and the provisioner scripts will run. This may take a
while. Once the provisioning finishes, the VM will shut down. Run
`vagrant up [linux/windows]` again, and you will end up just on the Desktop.
There should be several icons, including ReadMe. Open ReadMe, and follow the
instructions there.

Once you are done with the VM, you can shut it down normally from within the
VM. If you need to boot it again, you can `cd` into MK-Packager and run
`vagrant up [linux/windows]` again. If you wish to re-run the provisioner
scripts, run `vagrant up --provision [linux/windows]`. The VM will
automatically shut down when the re-provisioning finishes. If you wish to
delete the VM entirely, shut it down and run `vagrant destroy [linux/windows]`.

## Deployment Installer Targets

-   Windows 10 ([WiX msi][]) *Not yet implemented*
-   AppImage ([.NET Core SCD][]) *Not yet implemented*

## Development/Testing Installer Targets

-   Ubuntu 18.04 ([deb][]) *Work in progress*
-   Fedora 31 ([rpm][]) *Not yet implemented*

[Vagrant]: https://www.vagrantup.com/
[Docker]: https://github.com/docker/docker-ce
[mkxp]: https://github.com/Marin-MK/mkxp
[MK-Starter-Kit]: https://github.com/Marin-MK/MK-Starter-Kit
[MK-Editor]: https://github.com/Marin-MK/MK-Editor
[odl]: https://github.com/Marin-MK/odl
[SDL2-CS]: https://github.com/flibitijibibo/SDL2-CS
[install Vagrant]: https://www.vagrantup.com/intro/getting-started/install.html
[latest VirtualBox]: https://www.virtualbox.org/wiki/Downloads
[git]: https://git-scm.com/downloads
[deb]: http://packaging.ubuntu.com/html/packaging-new-software.html
[rpm]: https://docs.fedoraproject.org/en-US/packaging-guidelines/
[WiX msi]: https://wixtoolset.org/documentation/manual/v3/main/
[.NET Core SCD]: https://github.com/AppImage/AppImageKit/wiki/Bundling-.NET-Core-apps
