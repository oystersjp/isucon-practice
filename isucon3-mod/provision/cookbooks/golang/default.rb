# golang's dependencies
["tar", "git"].each do |p| package p end


# install
# NOTE: amazon-linux-extrasで1.14が入らないので手動でバイナリ取ってくる
execute "install golang" do
  command <<'CMD'
    curl -o /tmp/go1.14.4.linux-amd64.tar.gz -L https://golang.org/dl/go1.14.4.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf /tmp/go1.14.4.linux-amd64.tar.gz && \
    rm /tmp/go1.14.4.linux-amd64.tar.gz
CMD
  not_if "test -f /usr/local/go/bin/go"
end


# path
link "/usr/local/bin/go" do
  action :create
  to "/usr/local/go/bin/go"
  force true
end
