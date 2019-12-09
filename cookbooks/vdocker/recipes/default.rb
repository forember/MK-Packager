# vim: set ft=ruby ts=2 sts=2 sw=2 et :
docker_service "default" do
  action [:create, :start]
end
group "docker" do
  append true
  members ["vagrant"]
end
script "build packager images" do
  interpreter "bash"
  user "vagrant"
  group "docker"
  environment "HOME" => "/home/vagrant"
  cwd "/vagrant/docker"
  code <<-EOH
    set -ex
    function image {
      docker build -t "mk-packager-$1-ubuntu" -f "$1/ubuntu.dockerfile" "$1"
    }
    image sdl2-mk
    image physfs 
    EOH
end
docker_container "mk-packager-sdl2-mk-ubuntu" do
  volumes ["/vagrant/output:/packager/output"]
  action :create
end
docker_container "mk-packager-physfs-ubuntu" do
  volumes ["/vagrant/output:/packager/output"]
  action :create
end