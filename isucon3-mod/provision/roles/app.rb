# User & SSH
user "isucon" do
  action :create
end
file "/etc/sudoers.d/isucon" do
  action :create
  content "isucon ALL=(ALL) NOPASSWD: ALL"
end

directory "/home/isucon/.ssh" do
  action :create
  mode "0700"
  user "isucon"
  group "isucon"
end
remote_file "/home/isucon/.ssh/authorized_keys" do
  action :create
  source "../cookbooks/ssh/files/home/isucon/.ssh/authorized_keys"
  mode "0600"
  user "isucon"
  group "isucon"
end


# Nginx
execute "install nginx" do
  command "amazon-linux-extras install -y nginx1"
  not_if "test -d /etc/nginx"
end
service "nginx" do
  action :enable
end

# TODO: nginx設定ファイルを設置


# MySQL
execute "add yum repository for MySQL" do
  command "yum install -y https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm"
  not_if "test -f /etc/yum.repos.d/mysql-community.repo"
end
package "mysql-community-server" do
  action :install
  options "--disablerepo=mysql80-community --enablerepo mysql57-community"
  not_if "mysql --version"
end
service "mysqld" do
  action :enable
end


# Application
# TODO:
