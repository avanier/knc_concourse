default['concourse']['version'] = '3.8.0'
default['concourse']['rc_download_url'] = "https://github.com/concourse/bin/releases/download/v#{node['concourse']['version']}/concourse_linux_amd64"
default['concourse']['download_url'] = "https://github.com/concourse/concourse/releases/download/v#{node['concourse']['version']}/concourse_linux_amd64"

default['concourse']['install_location'] = '/usr/local/bin'

default['concourse']['user'] = 'concourse'
default['concourse']['group'] = 'concourse'

default['concourse']['no_firewall'] = false
