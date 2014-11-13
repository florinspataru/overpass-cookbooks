include_recipe 'dependencies'

node[:deploy].each do |application, deploy|

  log "message" do
    message "The app will be deployed to: #{application} :: #{deploy.inspect}"
    level :info
  end
  opsworks_deploy_user do
    deploy_data deploy
  end

end
