# placement source code
remote_directory "/opt/isucon3-mod" do
  action :create
  source "../../../"
  owner "isucon"
  group "isucon"
end

directory "/opt/isucon3-mod/app" do
  mode "0777"
end
directory "/opt/isucon3-mod/app/src" do
  mode "0777"
end


# build
execute "build application" do
  command "make build GO=/usr/local/go/bin/go"
  cwd "/opt/isucon3-mod/app"
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
