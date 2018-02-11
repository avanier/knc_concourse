
worker_conf = DeepMerge.safe_dup(node['concourse']['worker'])
web_secrets = data_bag_item(*node['concourse']['web_data_bag'].split('/'))
worker_secrets = data_bag_item(*node['concourse']['worker_data_bag'].split('/'))

if node['concourse']['worker']['CONCOURSE_WORK_DIR']
  directory node['concourse']['worker']['CONCOURSE_WORK_DIR'] do
    owner node['concourse']['user']
    group node['concourse']['group']
    mode '775'
    recursive true
    action :create
  end
end

if node['concourse']['worker']['CONCOURSE_BAGGAGECLAIM_VOLUMES']
  directory node['concourse']['worker']['CONCOURSE_BAGGAGECLAIM_VOLUMES'] do
    owner node['concourse']['user']
    group node['concourse']['group']
    mode '775'
    recursive true
    action :create
  end
end

%w[CONCOURSE_WORKER_PRIVATE_KEY CONCOURSE_TSA_PUBLIC_KEY].each do |k|
  directory File.dirname(node['concourse']['worker'][k]) do
    recursive true
    mode '750'
    owner 'root'
    group node['concourse']['group']
  end
end

file node['concourse']['worker']['CONCOURSE_WORKER_PRIVATE_KEY'] do
  content worker_secrets['private_key']
  mode '640'
  owner 'root'
  group node['concourse']['group']
  sensitive true
end

file node['concourse']['worker']['CONCOURSE_TSA_PUBLIC_KEY'] do
  content web_secrets['public_key']
  mode '640'
  owner 'root'
  group node['concourse']['group']
  sensitive true
end

node['concourse']['worker'].each do |k, v|
  worker_conf[k] = worker_secrets[k] if v == '___FULLFILLED_BY_DATABAG___'
end

file '/etc/sysconfig/concourse-worker' do
  content(
    worker_conf.map { |k, v| [k, v].join('=') }.join("\n") + "\n"
  )
  mode '640'
  owner 'root'
  group node['concourse']['group']
  sensitive true
  notifies :restart, 'service[concourse-worker]', :delayed
end

systemd_unit 'concourse-worker.service' do
  content(Unit: {
            Description: 'Concourse Worker',
            Documentation: 'https://concourse.ci/binaries.html',
            After: 'network.target'
          },
          Service: {
            EnvironmentFile: '/etc/sysconfig/concourse-worker',
            ExecStart: '/usr/local/bin/concourse worker',
            Restart: 'on-failure',
            User: 'root', # this sucks and should really be node['concourse']['user'],
            Group: 'root', # this sucks and should really be node['concourse']['group'],
            StandardOutput: 'journal',
            StandardError: 'journal',
            SyslogIdentifier: 'concourse-worker'
          })
  notifies :restart, 'service[concourse-worker]', :delayed
  action :create
end

service 'concourse-worker' do
  action %i[enable start]
end
