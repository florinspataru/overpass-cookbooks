remote_file node[:dynamodb][:src_path] do
      source node[:dynamodb][:url]
      path node[:dynamodb][:src_path]
      backup false
      notifies :run, "bash[extract_dynamodb]"
end

bash "extract_dynamodb" do
  cwd ::File.dirname(node[:dynamodb][:src_path])
  code <<-EOH
    mkdir -p #{node[:dynamodb][:install_path]}
    tar zxf #{node[:dynamodb][:src_path]} -C #{node[:dynamodb][:install_path]}
    rm -f -r #{node[:dynamodb][:src_path]}
  EOH

  not_if { File.exists?("#{node[:dynamodb][:install_path]}/dynamodb.jar") }
end