default['concourse']['local_postgres'] = true

default['postgresql']['enable_pgdg_yum'] = true
default['postgresql']['version'] = '9.6'
default['postgresql']['dir'] = '/var/lib/pgsql/9.6/data'
default['postgresql']['config']['data_directory'] = node['postgresql']['dir']
default['postgresql']['client']['packages'] = ['postgresql96', 'postgresql96-devel']
default['postgresql']['server']['packages'] = ['postgresql96-server']
default['postgresql']['server']['service_name'] = 'postgresql-9.6'
default['postgresql']['contrib']['packages'] = ['postgresql96-contrib']
default['postgresql']['setup_script'] = 'postgresql96-setup'

default['postgresql']['pg_hba'] = [
  { type: 'local', db: 'all', user: 'postgres', addr: nil, method: 'trust' },
  { type: 'local', db: 'all', user: 'all', addr: nil, method: 'ident' },
  { type: 'host', db: 'all', user: 'all', addr: '127.0.0.1/32', method: 'trust' },
  { type: 'host', db: 'all', user: 'all', addr: '::1/128', method: 'md5' }
]
