#
# Cookbook Name:: graylog
# Attributes:: default
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

default['graylog']['web_interface']['version'] = '0.20.6'
default['graylog']['web_interface']['user'] = 'graylog2'
default['graylog']['web_interface']['url'] = "https://github.com/Graylog2/graylog2-web-interface/releases/download/#{node['graylog']['web_interface']['version']}/graylog2-web-interface-#{node['graylog']['web_interface']['version']}.tgz"

default['graylog']['server']['version'] = '0.20.6'
default['graylog']['server']['user'] = 'graylog2'
default['graylog']['server']['url'] = "https://github.com/Graylog2/graylog2-server/releases/download/#{node['graylog']['server']['version']}/graylog2-server-#{node['graylog']['server']['version']}.tgz"
