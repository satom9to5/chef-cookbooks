# Vhosts Document Directory Create
directory "/var/www/vhosts/#{node['apache']['vhosts_name']}/www/httpdocs" do
  mode 00775
  owner "apache"
  group "apache"
  action :create
  recursive true
end

# Vhosts Setting File Create
template "#{node['apache']['dir']}/vhosts/#{node['apache']['vhosts_name']}.conf" do
  source "vhosts/default.erb"
  owner "root"
  group node['apache']['root_group']
  mode 00644
  notifies :restart, "service[apache2]"
end

