# install
execute "add yum repository for MySQL" do
  command "yum install -y https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm"
  not_if "test -f /etc/yum.repos.d/mysql-community.repo"
end

execute "disable mysql80 repository" do
  command "yum-config-manager --disable mysql80-community"
end

execute "enable mysql57 repository" do
  command "yum-config-manager --enable mysql57-community"
end

package "mysql-community-server" do
  action :install
  not_if "mysql --version"
end


# config file
remote_file "/etc/my.cnf" do
  action :create
  source :auto
  mode "0644"
end


# start
service "mysqld" do
  action [:enable, :start]
end
