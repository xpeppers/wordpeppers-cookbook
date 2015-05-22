include_recipe 'apt'
include_recipe 'wordpeppers::php'
include_recipe 'wordpeppers::web'
include_recipe 'wordpeppers::db'

cookbook_file '/etc/sysctl.conf' do
  source 'sysctl.conf'
  mode 00644
end

execute 'reload sysctl,conf' do
  command 'sysctl -p /etc/sysctl.conf'
end

apt_package 'git'
