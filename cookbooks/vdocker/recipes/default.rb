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
      docker build -t "mk-packager-$1-$2" -f "$1/$2.dockerfile" "$1"
    }
    image sdl2-mk ubuntu
    image physfs ubuntu
    image mkxp ubuntu
    image mkxp appimage
    EOH
end
[
  "sdl2-mk-ubuntu",
  "physfs-ubuntu",
  "mkxp-ubuntu",
  "mkxp-appimage"
].each do |name|
  docker_container "mk-packager-#{name}" do
    volumes ["/vagrant/output:/packager/output"]
    action :create
  end
end
