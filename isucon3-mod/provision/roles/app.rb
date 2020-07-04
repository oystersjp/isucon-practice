execute "install nginx" do
  command "amazon-linux-extras install -y nginx1"
  not_if "test -d /etc/nginx"
end