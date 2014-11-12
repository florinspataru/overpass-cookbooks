"recipe[composer]"

template "/etc/nginx/nginx.conf" do
  source "nginx.conf.erb"
  owner "root"
  group "root"
  mode 00644
end

service "nginx" do
  supports [:restart, :reload, :status]
  action [:restart]
end


#######################
# virtual hosts start #
#######################

template "/etc/nginx/sites-available/default" do
  source "sites-available.default.erb"
  owner "root"
  group "root"
  mode 00644
end

link "/etc/nginx/sites-enabled/default" do
  to "/etc/nginx/sites-available/default"
  link_type :symbolic
end

template "/etc/nginx/sites-available/api" do
  source "sites-available.api.erb"
  owner "root"
  group "root"
  mode 00644
end

link "/etc/nginx/sites-enabled/api" do
  to "/etc/nginx/sites-available/api"
  link_type :symbolic
end


#######################
# virtual hosts end   #
#######################

service "nginx" do
  supports [:restart, :reload, :status]
  action [:restart]
end