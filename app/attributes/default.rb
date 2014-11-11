#Servername what is set for the vagrants hostmanager plugin
default['app']['servername'] = ''
default['app']['base_dir'] = '/vagrant_data'

# for apache ant
default['ant']['install_method'] = 'package'
default['java']['jdk_version'] = '7'

#mysql config
default['mysql']['root_user'] = 'root'
default['mysql']['server_root_password'] = '123qwe'
default['mysql']['server_debian_password'] = '123qwe'
default['mysql']['version'] = '5.5'
default['mysql']['allow_remote_root'] = true

#dynamodb
puts default['app']
default['dynamodb']['url'] = 'http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_latest'
default['dynamodb']['src_path'] = default['app']['base_dir'] + "/tmp/dynamodb.tar.gz"
default['dynamodb']['install_path'] = default['app']['base_dir'] + "/bin/dynamodb"