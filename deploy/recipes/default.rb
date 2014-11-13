include_recipe 'dependencies'

node[:deploy].each do |application, deploy|

  log "message" do
    message "This is the message that will be added to the log."
    level :info
  end
  opsworks_deploy_user do
    deploy_data deploy
  end

end
