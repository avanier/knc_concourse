web_conf = DeepMerge.safe_dup(node['concourse']['web'])
web_secrets = data_bag_item(*node['concourse']['web']['data_bag'].split('/'))
worker_secrets = data_bag_item(*node['concourse']['worker']['data_bag'].split('/'))

node['concourse']['web'].each do |k, v|
  web_conf[k] = web_secrets[k] if v == '___FULLFILLED_BY_DATABAG___'
end

%w[CONCOURSE_TSA_HOST_KEY CONCOURSE_TSA_AUTHORIZED_KEYS CONCOURSE_SESSION_SIGNING_KEY].each do |k|
  directory File.dirname(node['concourse']['web'][k]) do
    recursive true
    mode '750'
    owner 'root'
    group node['concourse']['group']
  end
end

file node['concourse']['web']['CONCOURSE_TSA_AUTHORIZED_KEYS'] do
  content worker_secrets['public_key']
  mode '640'
  owner 'root'
  group node['concourse']['group']
  sensitive true
end

file node['concourse']['web']['CONCOURSE_TSA_HOST_KEY'] do
  content web_secrets['private_key']
  mode '640'
  owner 'root'
  group node['concourse']['group']
  sensitive true
end

file node['concourse']['web']['CONCOURSE_SESSION_SIGNING_KEY'] do
  content web_secrets['session_key']
  mode '640'
  owner 'root'
  group node['concourse']['group']
  sensitive true
end

file '/etc/sysconfig/concourse-web' do
  content(
    web_conf.map { |k, v| [k, v].join('=') }.join("\n") + "\n"
  )
  mode '640'
  owner 'root'
  group node['concourse']['group']
  sensitive true
  notifies :restart, 'service[concourse-web]', :delayed
end

systemd_unit 'concourse-web.service' do
  content(Unit: {
            Description: 'Concourse Web',
            Documentation: 'https://concourse.ci/binaries.html',
            After: 'network.target'
          },
          Service: {
            EnvironmentFile: '/etc/sysconfig/concourse-web',
            ExecStart: '/usr/local/bin/concourse web',
            Restart: 'on-failure',
            User: node['concourse']['user'],
            Group: node['concourse']['group'],
            StandardOutput: 'journal',
            StandardError: 'journal',
            SyslogIdentifier: 'concourse-web'
          })
  notifies :restart, 'service[concourse-worker]', :delayed
  action :create
end

firewall_rule 'concourse-atc' do
  protocol  :tcp
  port      node['concourse']['web']['CONCOURSE_BIND_PORT']
  command   :allow
  not_if    { node['concourse']['no_firewall'] }
end

firewall_rule 'concourse-tsa' do
  protocol  :tcp
  port      node['concourse']['web']['CONCOURSE_TSA_BIND_PORT']
  command   :allow
  not_if    { node['concourse']['no_firewall'] }
end

service 'concourse-web' do
  action %i[enable start]
end
