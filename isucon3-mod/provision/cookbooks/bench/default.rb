remote_directory "/home/isucon/qualifier_bench" do
  action :create
  source "files/home/isucon/qualifier_bench"
end

remote_directory "/opt/isucon" do
  action :create
  source "files/opt/isucon"
end

directory "/opt/isucon/bin" do
  action :create
  mode "0777"
end

# pigz
execute "install epel repository" do
  command "amazon-linux-extras install -y epel"
  not_if "test -f /etc/yum.repos.d/epel.repo"
end
# dependency bench
package "pigz" do
  options "--enablerepo=epel"
end

# dependency markdown
package "perl-Digest-MD5" do
  action :install
end