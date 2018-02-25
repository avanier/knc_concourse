default['concourse']['run_worker'] = true

default['concourse']['worker']['data_bag'] = 'concourse/worker-secrets'

default['concourse']['worker']['CONCOURSE_BAGGAGECLAIM_BIND_PORT'] = 7788
default['concourse']['worker']['CONCOURSE_BAGGAGECLAIM_DRIVER'] = 'btrfs'
default['concourse']['worker']['CONCOURSE_GARDEN_BIND_PORT'] = 7777
default['concourse']['worker']['CONCOURSE_NAME'] = node['fqdn']
default['concourse']['worker']['CONCOURSE_TSA_PUBLIC_KEY'] = '/etc/concourse/keys/web/public'
default['concourse']['worker']['CONCOURSE_TSA_WORKER_PRIVATE_KEY'] = '/etc/concourse/keys/worker/private'
default['concourse']['worker']['CONCOURSE_WORK_DIR'] = '/srv/concourse'
