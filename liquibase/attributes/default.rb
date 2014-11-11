#liquibase
puts default['ccs']
default['liquibase']['url'] = 'http://sourceforge.net/projects/liquibase/files/Liquibase%20Core/liquibase-3.2.0-bin.tar.gz/download'
default['liquibase']['jdbc_driver_url'] = 'http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.30.tar.gz'
default['liquibase']['src_path'] = default['ccs']['base_dir'] + '/tmp/liquibase.tar.gz'
default['liquibase']['install_path'] = default['ccs']['base_dir'] + '/bin/liquibase'
default['liquibase']['jdbc_driver_src'] = default['ccs']['base_dir'] + '/tmp/jdbc.tar.gz'
default['liquibase']['changelog_master_path'] = default['liquibase']['install_path'] + '/changelog'
default['liquibase']['database']['user'] = default['mysql']['root_user']
default['liquibase']['database']['password'] = default['mysql']['server_root_password']
