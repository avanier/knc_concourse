node.default['firewall']['firewalld']['permanent'] = true
node.default['firewall']['allow_loopback'] = true
node.default['firewall']['allow_ssh'] = true

include_recipe 'firewall::default'

firewall_rule 'concourse-garden' do
  protocol  :tcp
  port      node['concourse']['worker']['CONCOURSE_GARDEN_BIND_PORT']
  command   :allow
end

firewall_rule 'concourse-baggageclaim' do
  protocol  :tcp
  port      node['concourse']['worker']['CONCOURSE_BAGGAGECLAIM_BIND_PORT']
  command   :allow
end

firewall_rule 'concourse-atc' do
  protocol  :tcp
  port      node['concourse']['web']['CONCOURSE_BIND_PORT']
  command   :allow
end

firewall_rule 'concourse-tsa' do
  protocol  :tcp
  port      node['concourse']['web']['CONCOURSE_TSA_BIND_PORT']
  command   :allow
end
