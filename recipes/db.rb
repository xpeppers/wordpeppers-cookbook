mysql_service 'default' do
  version node['wordpeppers']['db']['version']
  initial_root_password node['wordpeppers']['db']['root_password']
  action [:create, :start]
end

mysql_client 'default' do
  action :create
end

mysql2_chef_gem 'default' do
  action :install
end

socket = "/var/run/mysql-default/mysqld.sock"

directory '/var/run/mysqld'  do
  owner 'mysql'
  group 'mysql'
  mode '2775'
  action :create
end

link '/var/run/mysqld/mysqld.sock' do
  to socket
  not_if 'test -f /var/run/mysqld/mysqld.sock'
end

connection_info = {
  host: 'localhost',
  username: 'root',
  password: node['wordpeppers']['db']['root_password']
}

mysql_database node['wordpeppers']['db']['name'] do
  connection connection_info
  action :create
end

mysql_database_user node['wordpeppers']['db']['user'] do
  connection connection_info
  database_name node['wordpeppers']['db']['name']
  password node['wordpeppers']['db']['password']
  privileges [:all]
  action [:create, :grant]
end
