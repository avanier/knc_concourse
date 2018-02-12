if node['environment'] =~ /(prod|production)/ # ~FC039
  hell = "Dude! I friggin' told you not to run this in prod!"
  raise hell
end

group node['concourse']['group']

user node['concourse']['user'] do
  group node['concourse']['group']
  manage_home false
  shell '/usr/sbin/nologin'
end

source_url = node['concourse']['version'] =~ /\-rc\.\d+/ ? node['concourse']['rc_download_url'] : node['concourse']['download_url']

remote_file File.join(node['concourse']['install_location'], 'concourse') do
  source source_url
  owner node['concourse']['user']
  group node['concourse']['group']
  mode '0755'
  notifies :restart, 'service[concourse-worker]', :delayed if node['concourse']['run_web']
  notifies :restart, 'service[concourse-web]', :delayed if node['concourse']['run_worker']
end
