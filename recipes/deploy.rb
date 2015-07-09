group 'ubuntu' do
  action :create
  append true
end

user 'ubuntu' do
  gid 'ubuntu'
  home '/home/ubuntu'
  shell '/bin/bash'
  supports :manage_home => true
  action [ :create, :manage ]
end

group 'www-data' do
  action :modify
  members 'ubuntu'
  append true
end

directory '/home/ubuntu/.ssh' do
  owner 'ubuntu'
  group 'ubuntu'
  mode 0755
  action :create
  not_if { File.exists? '/home/ubuntu/.ssh' }
end

file '/home/ubuntu/.ssh/id_rsa' do
  content node['wordpeppers']['deploy']['private_key']
  owner 'ubuntu'
  group 'ubuntu'
  mode 0600
  action :create
end

cookbook_file '/home/ubuntu/.ssh/config' do
  source 'config'
  owner 'ubuntu'
  group 'ubuntu'
  mode 0600
  action :create
end

file '/home/ubuntu/.ssh/authorized_keys' do
  content node['wordpeppers']['deploy']['authorized_keys']
  owner 'ubuntu'
  group 'ubuntu'
  mode 0600
  action :create
end

directory node['wordpeppers']['web']['docroot'] do
  owner 'www-data'
  group 'www-data'
  mode 0775
  action :create
  recursive true
  not_if { File.exists? '/var/www' }
end
