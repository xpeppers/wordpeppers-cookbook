default['apt']['compile_time_update'] = true
default['php']['version'] = '5.5.9'
default['nginx']['default_site_enabled'] = false

default['wordpeppers']['web']['user'] = 'www-data'
default['wordpeppers']['web']['group'] = 'www-data'
default['wordpeppers']['web']['php_options'] = {}
default['wordpeppers']['web']['server_name'] = 'localhost'
default['wordpeppers']['web']['docroot'] = '/var/www/wordpress'

default['wordpeppers']['db']['version'] = '5.6'
default['wordpeppers']['db']['name'] = 'wordpress'
default['wordpeppers']['db']['user'] = 'wordpress'
default['wordpeppers']['db']['password'] = 'wordpress'

default['wordpeppers']['deploy']['private_key'] = ''
default['wordpeppers']['deploy']['authorized_keys'] = ''

