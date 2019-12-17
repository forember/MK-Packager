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
vagrant up ubuntu
```

You can also run `vagrant up fedora` to create the Fedora VM, or
`vagrant up windows` to create the Windows VM (*Note:* the Windows VM can
currently be created, but it doesn't do anything yet).

VirtualBox will open, and the provisioner scripts will run. This may take a
while. Once the provisioning finishes, the VM will shut down. Run
`vagrant up [ubuntu/fedora/windows]` again, and you will end up just on the
Desktop. There should be several icons, including ReadMe (*TODO*). Open ReadMe,
and follow the instructions there.

Once you are done with the VM, you can shut it down normally from within the
VM. If you need to boot it again, you can `cd` into MK-Packager and run
`vagrant up [ubuntu/fedora/windows]` again. If you wish to re-run the
provisioner scripts, run `vagrant up --provision [ubuntu/fedora/windows]`. The
VM will automatically shut down when the re-provisioning finishes. If you wish
to delete the VM entirely, shut it down and run
`vagrant destroy [ubuntu/fedora/windows]`.

## Targets

|        Target         |    Technology     |     MKXP      |   MK-Editor   |
| :-------------------- | :---------------- | :-----------: | :-----------: |
| **Self-Contained**    |                   |               |               |
| Portable EXE          | [.NET Core SFP][] | &cross;       | &cross;       |
| AppImage              | [pkg2appimage][]  | &check;&sext; | &cross;       |
| **Installers**        |                   |               |               |
| Windows 10 Installer  | [WiX msi][]       | &cross;       | &cross;       |
| Ubuntu 18.04 Package  | [deb][]           | &check;&sext; | &cross;       |
| Fedora 31 Package     | [rpm][]           | &cross;       | &cross;       |

&sext;: Does not yet include all MK-Starter-Kit extension libraries.

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
[.NET Core SFP]: https://github.com/dotnet/designs/blob/master/accepted/single-file/design.md
[pkg2appimage]: https://github.com/AppImage/pkg2appimage
[WiX msi]: https://wixtoolset.org/documentation/manual/v3/main/
[deb]: http://packaging.ubuntu.com/html/packaging-new-software.html
[rpm]: https://docs.fedoraproject.org/en-US/packaging-guidelines/
