# install
execute "add yum repository for MySQL" do
  command "yum install -y https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm"
  not_if "test -f /etc/yum.repos.d/mysql-community.repo"
end

package "mysql-community-server" do
  action :install
  options "--disablerepo=mysql80-community --enablerepo mysql57-community"
  not_if "mysql --version"
end

# start
service "mysqld" do
  action [:enable, :start]
end