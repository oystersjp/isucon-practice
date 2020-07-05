# placement source code
remote_directory "/opt/isucon3-mod" do
  action :create
  source "../../../"
  owner "isucon"
  group "isucon"
end


# build
execute "build application" do
  command "make -C /opt/isucon3-mod/app build GO=/usr/local/go/bin/go"
end


# supervisor
execute "install epel repository" do
  command "amazon-linux-extras install -y epel"
  not_if "test -f /etc/yum.repos.d/epel.repo"
end

package "supervisor" do
  options "--enablerepo=epel"
end

remote_file "/etc/supervisord.d/app.ini" do
  action :create
  source :auto
end


# start applciation
service "supervisord" do
  action [:enable, :start]
end
