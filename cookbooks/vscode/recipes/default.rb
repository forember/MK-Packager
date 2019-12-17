# vim: set ft=ruby ts=2 sts=2 sw=2 et :
sc_vscode_installer "install vscode" do
  action :install
end
[
  "ms-vscode.csharp",
  "rebornix.ruby",
  "chef-software.chef",
  "ms-azuretools.vscode-docker"
].each do |name|
  sc_vscode_extension name do
    user "vagrant"
    action :install
  end
end
directory "/home/vagrant/.config/Code/User" do
  recursive true
  owner "vagrant"
  group "vagrant"
  mode "0755"
end
cookbook_file "/home/vagrant/.config/Code/User/settings.json" do
  source "settings.json"
  owner "vagrant"
  group "vagrant"
  mode "0644"
end
