include_recipe "app::java7"

if !File.exists?("#{node[:liquibase][:install_path]}/liquibase.jar")
    remote_file node[:liquibase][:src_path] do
      source node[:liquibase][:url]
      path node[:liquibase][:src_path]
      backup false
      notifies :run, "bash[extract_liquibase]"
    end

    bash "extract_liquibase" do
      cwd ::File.dirname(node[:liquibase][:src_path])
      code <<-EOH
        mkdir -p #{node[:liquibase][:install_path]}
        tar zxf #{node[:liquibase][:src_path]} -C #{node[:liquibase][:install_path]}
        rm -f -r #{node[:liquibase][:src_path]}
      EOH

      not_if { File.exists?("#{node[:liquibase][:install_path]}/liquibase.jar") }
    end

    directory node[:liquibase][:changelog_master_path] do
      action :create
    end

    if !File.exists?("#{node[:liquibase][:changelog_master_path]}/changelog-master.xml")
      template "#{node[:liquibase][:changelog_master_path]}/changelog-master.xml" do
        source "changelog-master.xml"
      end
    end

    if !File.exists?("#{node[:liquibase][:changelog_master_path]}/init.xml")
      template "#{node[:liquibase][:changelog_master_path]}/init.xml" do
        source "init.xml"
      end
    end

    remote_file node[:liquibase][:jdbc_driver_src] do
      source node[:liquibase][:jdbc_driver_url]
      path node[:liquibase][:jdbc_driver_src]
      backup false
      notifies :run, "bash[extract_jdbc]"
    end

    bash "extract_jdbc" do
      cwd ::File.dirname(node[:liquibase][:jdbc_driver_src])
      code <<-EOH
        mkdir -p #{node[:liquibase][:install_path]}
        tar zxf #{node[:liquibase][:jdbc_driver_src]} -C #{node[:liquibase][:install_path]}
        rm -f -r #{node[:liquibase][:jdbc_driver_src]}
      EOH
    end    

    template "#{node[:liquibase][:install_path]}/migrate.sh" do
      source "migrate.erb"
      variables({
         :database_user => node[:liquibase][:database][:user],
         :database_password => node[:liquibase][:database][:password],
         :database => node[:mysql][:database],
         :install_path => node[:liquibase][:install_path]
      })
    end
end