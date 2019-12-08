# vim: set ft=ruby ts=2 sts=2 sw=2 et :
log "Installing xubuntu-desktop takes a long time."
package "xubuntu-desktop"
package "gdebi"
cookbook_file "/etc/lightdm/lightdm.conf" do
  source "lightdm.conf"
  owner "root"
  group "root"
  mode "0644"
end
script "disable apport" do
  interpreter "bash"
  code <<-EOH
    systemctl disable --now  apport.service
    sed -i 's/^enabled=1/enabled=0/' /etc/default/apport
    cat /etc/default/apport
    EOH
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
