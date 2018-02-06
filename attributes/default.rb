default['concourse']['version'] = '3.9.0-rc.6'
default['concourse']['download_url'] = "https://github.com/concourse/bin/releases/download/v#{node['concourse']['version']}/concourse_linux_amd64"

default['concourse']['install_location'] = '/usr/local/bin'

default['concourse']['user'] = 'concourse'
default['concourse']['group'] = 'concourse'

default['concourse']['run_web'] = true
default['concourse']['run_worker'] = true

default['concourse']['local_postgres'] = true

default['concourse']['web']

default['concourse']['worker']['CONCOURSE_NAME'] = node['fqdn']
default['concourse']['worker']['CONCOURSE_TAG'] = nil
default['concourse']['worker']['CONCOURSE_TEAM'] = nil
default['concourse']['worker']['http_proxy'] = nil
default['concourse']['worker']['https_proxy'] = nil
default['concourse']['worker']['no_proxy'] = nil
default['concourse']['worker']['CONCOURSE_WORK_DIR'] = '/srv/concourse/work'
default['concourse']['worker']['CONCOURSE_BIND_IP'] = '127.0.0.1'
default['concourse']['worker']['CONCOURSE_BIND_PORT'] = 7777
default['concourse']['worker']['CONCOURSE_PEER_IP'] = nil
default['concourse']['worker']['CONCOURSE_GARDEN_LOG_LEVEL'] = 'info'
default['concourse']['worker']['CONCOURSE_GARDEN_BIND_IP'] = node['concourse']['worker']['CONCOURSE_BIND_PORT']
default['concourse']['worker']['CONCOURSE_GARDEN_BIND_SOCKET'] = '/tmp/garden.sock'
default['concourse']['worker']['CONCOURSE_GARDEN_DEBUG_BIND_IP'] = nil
default['concourse']['worker']['CONCOURSE_GARDEN_DEBUG_BIND_PORT'] = 17073
default['concourse']['worker']['CONCOURSE_GARDEN_SKIP_SETUP'] = false
default['concourse']['worker']['CONCOURSE_GARDEN_DEPOT'] = '/var/run/gdn/depot'
default['concourse']['worker']['CONCOURSE_GARDEN_PROPERTIES_PATH'] = nil
default['concourse']['worker']['CONCOURSE_GARDEN_CONSOLE_SOCKETS_PATH'] = nil
default['concourse']['worker']['CONCOURSE_GARDEN_CLEANUP_PROCESS_DIRS_ON_WAIT'] = nil
default['concourse']['worker']['CONCOURSE_GARDEN_DEFAULT_ROOTFS'] = nil
default['concourse']['worker']['CONCOURSE_GARDEN_DEFAULT_GRACE_TIME'] = nil
default['concourse']['worker']['CONCOURSE_GARDEN_DESTROY_CONTAINERS_ON_STARTUP'] = nil
default['concourse']['worker']['CONCOURSE_GARDEN_APPARMOR'] = 
default['concourse']['worker']['CONCOURSE_GARDEN_ASSETS_DIR'] = 
default['concourse']['worker']['CONCOURSE_GARDEN_DADOO_BIN'] = 
default['concourse']['worker']['CONCOURSE_GARDEN_NSTAR_BIN'] = 
default['concourse']['worker']['CONCOURSE_GARDEN_TAR_BIN'] =
default['concourse']['worker']['CONCOURSE_GARDEN_IPTABLES_BIN'] =
default['concourse']['worker']['CONCOURSE_GARDEN_IPTABLES_RESTORE_BIN'] =
default['concourse']['worker']['CONCOURSE_GARDEN_INIT_BIN']
default['concourse']['worker']['CONCOURSE_GARDEN_RUNC_BIN']
default['concourse']['worker']['CONCOURSE_GARDEN_NEWUIDMAP_BIN']
default['concourse']['worker']['CONCOURSE_GARDEN_NEWGIDMAP_BIN']
default['concourse']['worker']['CONCOURSE_GARDEN_GRAPH']
default['concourse']['worker']['CONCOURSE_GARDEN_GRAPH_CLEANUP_THRESHOLD_IN_MEGABYTES']
default['concourse']['worker']['CONCOURSE_GARDEN_PERSISTENT_IMAGE']
default['concourse']['worker']['CONCOURSE_GARDEN_IMAGE_PLUGIN_EXTRA_ARG']
default['concourse']['worker']['CONCOURSE_GARDEN_PRIVILEGED_IMAGE_PLUGIN']
default['concourse']['worker']['CONCOURSE_GARDEN_PRIVILEGED_IMAGE_PLUGIN_EXTRA_ARG']
default['concourse']['worker']['CONCOURSE_GARDEN_DOCKER_REGISTRY']
default['concourse']['worker']['CONCOURSE_GARDEN_INSECURE_DOCKER_REGISTRY']
default['concourse']['worker']['CONCOURSE_GARDEN_NETWORK_POOL']
default['concourse']['worker']['CONCOURSE_GARDEN_ALLOW_HOST_ACCESS']
default['concourse']['worker']['CONCOURSE_GARDEN_DENY_NETWORK']
default['concourse']['worker']['CONCOURSE_GARDEN_ALLOW_NETWORK']
default['concourse']['worker']['CONCOURSE_GARDEN_DNS_SERVER']
default['concourse']['worker']['CONCOURSE_GARDEN_ADDITIONAL_DNS_SERVER']
default['concourse']['worker']['CONCOURSE_GARDEN_EXTERNAL_IP']
default['concourse']['worker']['CONCOURSE_GARDEN_PORT_POOL_START']
default['concourse']['worker']['']
default['concourse']['worker']
default['concourse']['worker']
default['concourse']['worker']
default['concourse']['worker']
default['concourse']['worker']
