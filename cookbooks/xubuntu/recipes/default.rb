# vim: set ft=ruby ts=2 sts=2 sw=2 et :
log "Installing xubuntu-desktop takes a long time."
package "xubuntu-desktop"
cookbook_file "/etc/lightdm/lightdm.conf" do
  source "lightdm.conf"
  owner "root"
  group "root"
  mode "0644"
end
