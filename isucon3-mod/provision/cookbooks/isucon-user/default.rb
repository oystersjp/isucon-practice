# create user and group
user "isucon" do
  action :create
end

# sudoable
file "/etc/sudoers.d/isucon" do
  action :create
  content "isucon ALL=(ALL) NOPASSWD: ALL"
  owner "root"
  group "root"
end

# ssh login
directory "/home/isucon/.ssh" do
  action :create
  mode "0700"
  owner "isucon"
  group "isucon"
end

remote_file "/home/isucon/.ssh/authorized_keys" do
  action :create
  source :auto
  mode "0600"
  owner "isucon"
  group "isucon"
end
