include_recipe 'php'
include_recipe 'php::module_mysql'

include_recipe 'php-fpm'

php_fpm_pool "www" do
  enable false
end

php_fpm_pool 'wordpress' do
  enable true
  listen '127.0.0.1:9001'
  user node['wordpeppers']['user']
  group node['wordpeppers']['group']
  process_manager 'dynamic'
  listen_owner node['wordpeppers']['user']
  listen_group node['wordpeppers']['group']
  php_options node['wordpeppers']['php_options']
  start_servers 5
end

