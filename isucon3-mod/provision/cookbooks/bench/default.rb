remote_directory "/opt/isucon/data" do
  action :create
  source :auto
end

# pigz
execute "install epel repository" do
  command "amazon-linux-extras install -y epel"
  not_if "test -f /etc/yum.repos.d/epel.repo"
end
package "pigz" do
  options "--enablerepo=epel"
end