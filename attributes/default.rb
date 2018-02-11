default['concourse']['version'] = '3.8.0'
default['concourse']['rc_download_url'] = "https://github.com/concourse/bin/releases/download/v#{node['concourse']['version']}/concourse_linux_amd64"
default['concourse']['download_url'] = "https://github.com/concourse/concourse/releases/download/v#{node['concourse']['version']}/concourse_linux_amd64"

default['concourse']['install_location'] = '/usr/local/bin'

default['concourse']['user'] = 'concourse'
default['concourse']['group'] = 'concourse'

default['concourse']['run_web'] = true
default['concourse']['run_worker'] = true

default['concourse']['local_postgres'] = true

default['concourse']['web_data_bag'] = 'concourse/web-secrets'
default['concourse']['worker_data_bag'] = 'concourse/worker-secrets'

default['concourse']['worker']['CONCOURSE_BAGGAGECLAIM_DRIVER'] = 'btrfs'
default['concourse']['worker']['CONCOURSE_BAGGAGECLAIM_VOLUMES'] = '/srv/concourse/volumes'
default['concourse']['worker']['CONCOURSE_NAME'] = node['fqdn']
default['concourse']['worker']['CONCOURSE_TSA_PUBLIC_KEY'] = '/etc/concourse/keys/web/public'
default['concourse']['worker']['CONCOURSE_WORK_DIR'] = '/srv/concourse/work'
default['concourse']['worker']['CONCOURSE_WORKER_PRIVATE_KEY'] = '/etc/concourse/keys/worker/private'

default['concourse']['web']['CONCOURSE_BASIC_AUTH_PASSWORD'] = '___FULLFILLED_BY_DATABAG___'
default['concourse']['web']['CONCOURSE_BASIC_AUTH_USERNAME'] = '___FULLFILLED_BY_DATABAG___'
default['concourse']['web']['CONCOURSE_POSTGRES_PASSWORD'] = nil
default['concourse']['web']['CONCOURSE_POSTGRES_USER'] = 'postgres'
default['concourse']['web']['CONCOURSE_TSA_AUTHORIZED_KEYS'] = '/etc/concourse/keys/worker/public'
default['concourse']['web']['CONCOURSE_TSA_HOST_KEY'] = '/etc/concourse/keys/web/private'
default['concourse']['web']['CONCOURSE_SESSION_SIGNING_KEY'] = '/etc/concourse/keys/web/session'

default['postgresql']['enable_pgdg_yum'] = true
default['postgresql']['version'] = "9.6"
default['postgresql']['dir'] = "/var/lib/pgsql/9.6/data"
default['postgresql']['config']['data_directory'] = node['postgresql']['dir']
default['postgresql']['client']['packages'] = ["postgresql96", "postgresql96-devel"]
default['postgresql']['server']['packages'] = ["postgresql96-server"]
default['postgresql']['server']['service_name'] = "postgresql-9.6"
default['postgresql']['contrib']['packages'] = ["postgresql96-contrib"]
default['postgresql']['setup_script'] = "postgresql96-setup"

default['postgresql']['pg_hba'] = [
  { type: 'local', db: 'all', user: 'postgres', addr: nil, method: 'trust' },
  { type: 'local', db: 'all', user: 'all', addr: nil, method: 'ident' },
  { type: 'host', db: 'all', user: 'all', addr: '127.0.0.1/32', method: 'trust' },
  { type: 'host', db: 'all', user: 'all', addr: '::1/128', method: 'md5' },
]
