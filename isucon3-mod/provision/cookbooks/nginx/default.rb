# install nginx
execute "install nginx" do
  command "amazon-linux-extras install -y nginx1"
  not_if "test -d /etc/nginx"
end


# placement config files
remote_file "/etc/nginx/nginx.conf" do
  action :create
  source :auto
end

remote_file "/etc/nginx/conf.d/isucon-app.conf" do
  action :create
  source :auto
end


# start
service "nginx" do
  action [:enable, :start]
end
