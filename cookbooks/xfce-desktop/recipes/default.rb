# vim: set ft=ruby ts=2 sts=2 sw=2 et :
def install_package(ubuntu_name, fedora_name, fallback_name)
end
log "Installing Xfce takes a long time."
install_package "xubuntu-desktop", "@xfce-desktop-environment", "xfce4"
case node[:platform]
when "ubuntu" then
  package "xubuntu-desktop"
when "fedora" then
  script "install Xfce Desktop" do
    interpreter "bash"
    code <<-EOH
      yes | dnf -y install '@xfce-desktop-environment'
      systemctl enable lightdm.service
      systemctl set-default graphical.target
      EOH
  end
else
  log "Unsupported distro; falling back to best guess." do
    level :warn
  end
  package "xfce4"
end
package "zenity"
package "git"
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
case node[:platform]
when "ubuntu" then
  install_file "/etc/lightdm/lightdm.conf", "root", "0644"
else
  install_file "/etc/lightdm/lightdm.conf.d/70-autologin.conf", "root", "0644"
end
install_file "/usr/local/bin/resolution", "root", "0755"
install_file "/usr/local/share/applications/resolution.desktop", "root", "0644"
install_file "/home/vagrant/Desktop/resolution.desktop", "vagrant", "0755"
