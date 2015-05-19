node.set_unless['nginx']['default_site_enabled'] = false
include_recipe 'nginx'

template "#{node['nginx']['dir']}/sites-enabled/wordpress.conf" do
  source 'wordpress.conf.erb'
  variables(
    docroot: node['wordpeppers']['docroot'],
  )
  action :create
end
