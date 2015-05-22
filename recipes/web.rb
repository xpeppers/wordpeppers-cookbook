include_recipe 'nginx'

template "#{node['nginx']['dir']}/sites-enabled/wordpress.conf" do
  source 'wordpress.conf.erb'
  variables(
    server_name: node['wordpeppers']['server_name'],
    docroot: node['wordpeppers']['docroot']
  )
  action :create
end
