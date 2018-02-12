node.default['postgresql']['enable_pgdg_yum'] = true
node.default['postgresql']['version'] = '9.6'
node.default['postgresql']['dir'] = '/var/lib/pgsql/9.6/data'
node.default['postgresql']['config']['data_directory'] = node['postgresql']['dir']
node.default['postgresql']['client']['packages'] = ['postgresql96', 'postgresql96-devel']
node.default['postgresql']['server']['packages'] = ['postgresql96-server']
node.default['postgresql']['server']['service_name'] = 'postgresql-9.6'
node.default['postgresql']['contrib']['packages'] = ['postgresql96-contrib']
node.default['postgresql']['setup_script'] = 'postgresql96-setup'

node.default['postgresql']['pg_hba'] = [
  { type: 'local', db: 'all', user: 'postgres', addr: nil, method: 'trust' },
  { type: 'local', db: 'all', user: 'all', addr: nil, method: 'ident' },
  { type: 'host', db: 'all', user: 'all', addr: '127.0.0.1/32', method: 'trust' },
  { type: 'host', db: 'all', user: 'all', addr: '::1/128', method: 'md5' }
]

include_recipe 'postgresql::server'
include_recipe 'postgresql::client'

execute 'create_database' do
  command 'psql -U postgres -c "CREATE DATABASE atc"'
  not_if "psql -U postgres -tc \"SELECT 1 FROM pg_database WHERE datname = 'atc'\" | grep -q 1"
end
