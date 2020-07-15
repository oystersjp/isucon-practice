execute "install netdata" do
  command "bash -c 'bash <(curl -Ss https://my-netdata.io/kickstart.sh) --dont-wait'"
  not_if "which netdata"
end
