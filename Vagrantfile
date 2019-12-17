# vim: set ft=ruby ts=2 sts=2 sw=2 et :
Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox" do |vbox|
    vbox.gui = true
    vbox.linked_clone = true
    vbox.cpus = 2
    vbox.memory = 4096
    vbox.customize ["modifyvm", :id, "--vram", "256",
        "--acpi", "on", "--ioapic", "on", "--hwvirtex", "on",
        "--clipboard", "bidirectional"]
  end
  def linux_chef_base(chef)
    chef.arguments = "--chef-license accept"
    chef.add_recipe "upgrade"
    chef.add_recipe "xfce-desktop"
    chef.add_recipe "vdocker"
    chef.add_recipe "vscode"
  end
  config.vm.define "ubuntu" do |ubuntu|
    ubuntu.vm.box = "bento/ubuntu-18.04"
    ubuntu.vm.provider "virtualbox" do |vbox|
      vbox.customize ["modifyvm", :id, "--ostype", "Ubuntu_64"]
    end
    ubuntu.vm.provision "chef_solo" do |chef|
      linux_chef_base chef
      chef.add_recipe "ubuntu-extra"
    end
    ubuntu.vm.provision "shell", inline: "poweroff"
  end
  config.vm.define "fedora", autostart: false do |fedora|
    fedora.vm.box = "bento/fedora-31"
    fedora.vm.provider "virtualbox" do |vbox|
      vbox.customize ["modifyvm", :id, "--ostype", "Fedora_64"]
    end
    fedora.vm.provision "shell", path: "scripts/DisableCgroupsV2.bash"
    fedora.vm.provision "shell", inline: "true"
    fedora.vm.provision "chef_solo" do |chef|
      linux_chef_base chef
    end
    fedora.vm.provision "shell", inline: "poweroff"
  end
  config.vm.define "windows", autostart: false do |windows|
    windows.vm.box = "gusztavvargadr/windows-10"
    windows.vm.provider "virtualbox" do |vbox|
      vbox.customize ["modifyvm", :id, "--ostype", "Windows10_64"]
    end
  end
end
