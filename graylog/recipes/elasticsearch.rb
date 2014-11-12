#
# Cookbook Name:: graylog
# Recipe:: elasticsearch
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

# Setup official elasticsearch PPA
apt_repository 'elasticsearch' do
  uri "http://packages.elasticsearch.org/elasticsearch/#{node['graylog']['elasticsearch']['version']}/debian"
  distribution 'stable'
  components %w(main)
  key 'http://packages.elasticsearch.org/GPG-KEY-elasticsearch'
end

package 'openjdk-7-jre'
package 'elasticsearch'

template '/etc/elasticsearch/elasticsearch.yml' do
  mode      00644
  source    'elasticsearch/elasticsearch.yml.erb'
  variables cluster_name: node['graylog']['elasticsearch']['cluster_name'],
            host: node['graylog']['elasticsearch']['host'],
            port: node['graylog']['elasticsearch']['port']
end

template '/etc/default/elasticsearch' do
  mode      00644
  source    'elasticsearch/default.erb'
  variables heap_size: node['graylog']['elasticsearch']['heap_size']
end

service 'elasticsearch' do
  supports restart: true
  action [:enable, :start]

  subscribes :restart, 'template[/etc/elasticsearch/elasticsearch.yml]'
  subscribes :restart, 'template[/etc/default/elasticsearch]'
end
