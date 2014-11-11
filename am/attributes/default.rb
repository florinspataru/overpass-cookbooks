# ccs default
default[:ccs][:base_dir] = "/vagrant_data/ccs/public"
default[:ccs][:servername] = "ccsapi.test.local"

# for apache ant
default['ant']['install_method'] = 'package'
default['java']['jdk_version'] = '7'

#mysql config
default['mysql']['root_user'] = 'root'
default['mysql']['server_root_password'] = '123qwe'
default['mysql']['server_debian_password'] = '123qwe'
default['mysql']['version'] = '5.5'
default['mysql']['allow_remote_root'] = true
puts default[:app]
#liquibase
default['liquibase']['src_path'] = default['ccs']['base_dir'] + '/tmp/liquibase.tar.gz'
default['liquibase']['install_path'] = default['ccs']['base_dir'] + '/bin/liquibase'
default['liquibase']['jdbc_driver_src'] = default['ccs']['base_dir'] + '/tmp/jdbc.tar.gz'