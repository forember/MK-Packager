# vim: set ft=ruby ts=2 sts=2 sw=2 et :
sc_vscode_installer "install vscode" do
  action :install
end
sc_vscode_extension "ms-vscode.csharp" do
  user "vagrant"
  action :install
end
sc_vscode_extension "rebornix.Ruby" do
  user "vagrant"
  action :install
end
sc_vscode_extension "chef-software.Chef" do
  user "vagrant"
  action :install
end
sc_vscode_extension "ms-azuretools.vscode-docker" do
  user "vagrant"
  action :install
end
cookbook_file "/home/vagrant/.config/Code/User/settings.json" do
  source "settings.json"
  owner "vagrant"
  group "vagrant"
  mode "0644"
end
