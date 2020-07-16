# dependencies
package "unzip"


# install
execute "download kataribe's binary file" do
  command "curl -sSL -o /tmp/kataribe.zip https://github.com/matsuu/kataribe/releases/download/v0.4.1/kataribe-v0.4.1_linux_amd64.zip"
  not_if "test -f /usr/local/bin/kataribe"
end

execute "unzip kataribe" do
  command "unzip -d /tmp/kataribe /tmp/kataribe.zip"
  not_if "test -f /usr/local/bin/kataribe"
end

execute "move to /usr/local/bin" do
  command "mv /tmp/kataribe/kataribe /usr/local/bin/kataribe"
  not_if "test -f /usr/local/bin/kataribe"
end
