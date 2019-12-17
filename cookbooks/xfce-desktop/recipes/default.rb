# vim: set ft=ruby ts=2 sts=2 sw=2 et :
def install_package(ubuntu_name, fedora_name, fallback_name)
  case node[:platform]
  when "ubuntu" then
    selected_name = ubuntu_name
  when "fedora" then
    selected_name = fedora_name
  else
    selected_name = fallback_name
    log "Unsupported distro; falling back to best guess." do
      level :warn
    end
  end
  log "Platform is #{node[:platform]}. Installing #{selected_name}."
  package selected_name
end
log "Installing Xfce takes a long time."
install_package "xubuntu-desktop", "@xfce-desktop-environment", "xfce4"
install_package "virtualbox-guest-x11", "virtualbox-guest-additions", "virtualbox-guest-utils"
def install_file(f_path, f_owner, f_mode)
  directory File.dirname(f_path) do
    recursive true
    owner f_owner
    group f_owner
    mode "0755"
  end
  cookbook_file f_path do
    source File.basename(f_path)
    owner f_owner
    group f_owner
    mode f_mode
  end
end
install_file "/etc/lightdm/lightdm.conf", "root", "0644"
install_file "/usr/local/bin/resolution", "root", "0755"
install_file "/usr/local/share/applications/resolution.desktop", "root", "0644"
install_file "/home/vagrant/Desktop/resolution.desktop", "vagrant", "0755"
