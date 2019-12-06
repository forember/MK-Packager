# vim: set ft=ruby ts=2 sts=2 sw=2 et :
Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox" do |vbox|
    vbox.gui = true
    vbox.linked_clone = true
    vbox.cpus = 2
    vbox.memory = 4096
  end
  config.vm.define "linux" do |linux|
    linux.vm.box = "bento/ubuntu-18.04"
    linux.vm.provision "chef_solo" do |lchef|
      lchef.add_recipe "upgrade"
      lchef.add_recipe "xubuntu"
    end
  end
  config.vm.define "windows", autostart: false do |windows|
    windows.vm.box = "gusztavvargadr/windows-10"
  end
end
