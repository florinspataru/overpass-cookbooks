#
# Cookbook Name:: composer
# Attributes:: default
#
# Copyright 2012, Escape Studios
#

default[:composer][:install_globally] = false
default[:composer][:prefix] = "/usr/local"
default[:composer][:url] = "https://getcomposer.org/installer"
default[:composer][:install_dir] = default['app']['base_dir']
