#
# Cookbook Name:: apache2-vhosts
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# Vhosts Setting & Document Directory Create
directory "#{node['apache']['dir']}/vhosts" do
  mode 00775
  owner "root"
  group "root"
  action :create
  recursive true
end

# Vhosts Config File Create
template "#{node['apache']['dir']}/conf.d/vhosts.conf" do
  source "vhosts.conf.erb"
  owner "root"
  group node['apache']['root_group']
  mode 00644
  notifies :restart, "service[apache2]"
end


