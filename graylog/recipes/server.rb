#
# Cookbook Name:: graylog
# Recipe:: server
#
# Copyright (C) 2014 Chris Aumann
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

# Check whether password secret and root password is set
unless node['graylog']['server']['graylog2.conf']['password_secret']
  raise <<-EOS
    Password secret is not set!
    Please set the attribute `default['graylog']['server']['graylog2.conf']['password_secret'] = 'CHANGE ME!'`
    In your node configuration or wrapper cookbook! Use at least 64 characters.
    Generate one by using for example: "pwgen -s 96".
  EOS
end

unless node['graylog']['server']['graylog2.conf']['root_password_sha2']
  raise <<-EOS
    Admin password is not set!
    Please set the attribute `default['graylog']['server']['graylog2.conf']['root_password_sha2'] = '...'`
    In your node configuration or wrapper cookbook!
    Generate it with "echo -n yourpassword | shasum -a 256".

    For testing purposes only (!) you can use the following hash (password: "insecure")
    "1d92dae504a70fbcae6d3721a55d7eacaf94d3133ea5f0394b7d203d64841110"
  EOS
end


# Installation
ark 'graylog2-server' do
  url     node['graylog']['server']['url']
  version node['graylog']['server']['version']
  action  :install
end

# Create user
user node['graylog']['server']['user'] do
  system true
  home   '/nonexistent'
  shell  '/bin/false'
end

# Configuration
template '/etc/graylog2.conf' do
  mode      00644
  source    'graylog/graylog2.conf.erb'
  variables config: node['graylog']['server']['graylog2.conf']
end

# Graylog writes a node-id to this file, needs access
file '/etc/graylog2-server-node-id' do
  owner node['graylog']['server']['user']
end

# Service
template '/etc/init/graylog2-server.conf' do
  mode      00644
  source    'upstart/graylog2-server.erb'
  variables dir:        '/usr/local/graylog2-server',
            user:       node['graylog']['server']['user'],
            configfile: '/etc/graylog2.conf'
end

link '/etc/init.d/graylog2-server' do
  to '/lib/init/upstart-job'
end

service 'graylog2-server' do
  supports restart: true
  action [ :enable, :start ]

  subscribes :restart, 'template[/etc/graylog2.conf]'
  subscribes :restart, 'template[/etc/init/graylog2-server.conf]'
end
