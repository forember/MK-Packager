# vim: set ft=ruby ts=2 sts=2 sw=2 et :
log "unsupported distro" do
  message "Unrecognized distro; falling back to best guess."
  level :warn
  action :nothing
end
log "Installing Xfce takes a long time."
package "install xfce" do
  case node[:platform_family]
  when "debian", "ubuntu"
    package_name "xubuntu-desktop"
  when "fedora", "rhel"
    package_name "@xfce-desktop-environment"
  else
    package_name "xfce4"
    notifies :write, "unsupported distro"
  end
end
package "install vbox additions"
  case node[:platform_family]
  when "debian", "ubuntu"
    package_name "virtualbox-guest-x11"
  when "fedora", "rhel"
    package_name "virtualbox-guest-additions"
  else
    package_name "virtualbox-guest-utils"
    notifies :write, "unsupported distro"
  end
end
cookbook_file "/etc/lightdm/lightdm.conf" do
  source "lightdm.conf"
  owner "root"
  group "root"
  mode "0644"
end
script "desktop icons" do
  interpreter "bash"
  user "vagrant"
  group "vagrant"
  cwd "/home/vagrant/Desktop"
  code <<-EOH
    cp /vagrant/desktop/resolution.desktop resolution.desktop
    EOH
end
