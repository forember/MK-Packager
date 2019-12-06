# vim: set ft=ruby ts=2 sts=2 sw=2 et :
ruby_block "upgrade init" do
  block do
    node.run_state["could_upgrade"] = false
  end
end
ruby_block "could upgrade" do
  block do
    node.run_state["could_upgrade"] = true
  end
  action :nothing
end
apt_update "update apt repo" do
  action :update
  only_if { platform_family?("debian", "ubuntu") }
end
script "upgrade apt packages" do
  interpreter "bash"
  code <<-EOH
    DEBIAN_FRONTEND=noninteractive apt-get -y full-upgrade
    EOH
  notifies :run, "could upgrade", :immediately
  only_if { platform_family?("debian", "ubuntu") }
end
script "upgrade dnf packages" do
  interpreter "bash"
  code <<-EOH
    dnf -y upgrade
    EOH
  notifies :run, "could upgrade", :immediately
  only_if { platform_family?("fedora", "rhel") && ::File.exist?("/usr/bin/dnf") }
end
log "warn could not upgrade" do
  message "Cannot upgrade distros without apt or dnf; skipping."
  level :warn
  not_if lazy { node.run_state["could_upgrade"] }
end
