include_recipe 'nginx'

template "#{node['nginx']['dir']}/sites-enabled/wordpress.conf" do
  source 'wordpress.conf.erb'
  variables(
    server_name: node['wordpeppers']['web']['server_name'],
    docroot: node['wordpeppers']['web']['docroot']
  )
  action :create
end

directory node['wordpeppers']['web']['docroot'] do
  owner 'www-data'
  group 'www-data'
  mode '2775'
  recursive true
  action :create
end
