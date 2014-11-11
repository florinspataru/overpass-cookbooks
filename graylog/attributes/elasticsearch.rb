#
# Cookbook Name:: graylog
# Attributes:: elasticsearch
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

# Graylog v0.91.x supports Elasticsearch 1.3.2, so using 1.3 repository
default['graylog']['elasticsearch']['version'] = '1.3'

# Assign half of the systems memory to elasticsearch heap (recommended setting)
# See: http://support.torch.sh/help/kb/graylog2-server/configuring-and-tuning-elasticsearch-for-graylog2-v0200
default['graylog']['elasticsearch']['heap_size'] = "#{(node['memory']['total'].to_i / 1024 / 2).to_i}m"
default['graylog']['elasticsearch']['cluster_name'] = 'graylog2'

# Elasticsearch ip:port to use
default['graylog']['elasticsearch']['host'] = '127.0.0.1'
default['graylog']['elasticsearch']['port'] = 9300
