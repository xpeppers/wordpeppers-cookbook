include_recipe 'php'
include_recipe 'composer'
include_recipe 'php::module_mysql'
include_recipe 'php::module_curl'
include_recipe 'php-fpm'

php_fpm_pool 'www' do
  enable false
end

php_fpm_pool 'wordpress' do
  enable true
  listen '127.0.0.1:9001'
  user node['wordpeppers']['web']['user']
  group node['wordpeppers']['web']['group']
  process_manager 'dynamic'
  listen_owner node['wordpeppers']['web']['user']
  listen_group node['wordpeppers']['web']['group']
  php_options node['wordpeppers']['web']['php_options']
  start_servers 5
end

