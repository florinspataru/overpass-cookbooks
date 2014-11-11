package "beanstalkd" do
  action :install
end

template "/etc/default/beanstalkd" do
  source "beanstalkd.erb"
  owner "root"
  group "root"
end

service "beanstalkd" do
  action [:start]
end