# vim: set ft=ruby ts=2 sts=2 sw=2 et :
docker_service "default" do
  action [:create, :start]
end
group "docker" do
  append true
  members ["vagrant"]
end
