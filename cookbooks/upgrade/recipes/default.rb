# vim: set ft=ruby ts=2 sts=2 sw=2 et :
log "unsupported distro" do
  message "Cannot upgrade distros without apt or dnf; skipping."
  level :warn
  action :nothing
end
apt_update "update apt repo" do
  action :update
  only_if { platform_family?("debian", "ubuntu") }
end
script "upgrade packages" do
  interpreter "bash"
  case node[:platform_family]
  when "debian", "ubuntu" then
    code "yes | DEBIAN_FRONTEND=noninteractive apt-get -y full-upgrade"
  when "fedora", "rhel" then
    code "yes | dnf -y upgrade"
  else
    code "true"
    notifies :write, "unsupported distro"
  end
end
