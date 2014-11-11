# copy over xdebug.ini to node
template "#{node['php']['ext_conf_dir']}/20-xdebug.ini" do
  source "xdebug.ini.erb"
  owner "root"
  group "root"
  mode 0644
end