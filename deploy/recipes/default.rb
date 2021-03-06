include_recipe 'dependencies'

node[:deploy].each do |application, deploy|

  log "message" do
    message "The app will be deployed to: #{application} :: #{deploy.inspect}"
    level :info
  end
  opsworks_deploy do
    deploy_data deploy
    app application
  end
  
  script "composer-install" do
    interpreter "bash"
    cwd "#{deploy[:deploy_to]}/current"
    code <<-EOH
composer install
    EOH
  end

end
