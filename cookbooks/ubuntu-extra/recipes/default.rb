# vim: set ft=ruby ts=2 sts=2 sw=2 et :
package "gdebi"
script "disable apport" do
  interpreter "bash"
  code <<-EOH
    systemctl disable --now apport.service
    sed -i 's/^enabled=1/enabled=0/' /etc/default/apport
    cat /etc/default/apport
    EOH
end
