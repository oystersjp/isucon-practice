# User
include_recipe "../cookbooks/isucon-user"

# Nginx
include_recipe "../cookbooks/nginx"

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
  action [:enable, :start]
end


# Golang
["tar", "git"].each do |p| package p end
# NOTE: amazon-linux-extrasで1.14が入らないので手動でバイナリ取ってくる
execute "install golang" do
  command <<'CMD'
    curl -o /tmp/go1.14.4.linux-amd64.tar.gz -L https://golang.org/dl/go1.14.4.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf /tmp/go1.14.4.linux-amd64.tar.gz && \
    rm /tmp/go1.14.4.linux-amd64.tar.gz
CMD
  not_if "test -f /usr/local/go/bin/go"
end
file "/etc/profile" do
  action :edit
  block do |content|
    content.concat("\n", "export PATH=$PATH:/usr/local/go/bin")
  end
  not_if "grep \"/usr/local/go/bin\" /etc/profile"
end


# Application
include_recipe "../cookbooks/application"
