# vim: set ft=ruby ts=2 sts=2 sw=2 et :
docker_service "default" do
  action [:create, :start]
end
group "docker" do
  append true
  members ["vagrant"]
end
script "build ubuntu sdl2 packager image" do
  interpreter "bash"
  user "vagrant"
  group "docker"
  environment "HOME" => "/home/vagrant"
  cwd "/vagrant/docker/sdl2-mk"
  code <<-EOH
    groups
    docker build -t mk-packager-sdl2-mk-ubuntu -f ubuntu.dockerfile .
    EOH
end
docker_container "mk-packager-sdl2-mk-ubuntu" do
  volumes ["/vagrant/output:/packager/output"]
  action :create
end