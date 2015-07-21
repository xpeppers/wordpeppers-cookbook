package "mysql-server-#{node['wordpeppers']['db']['version']}"

mysql2_chef_gem 'default' do
  client_version node['wordpeppers']['db']['version']
    action :install
end

service 'mysql' do
    action [:enable, :start]
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
