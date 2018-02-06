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

remote_file File.join(node['concourse']['install_location'], 'concourse') do
  source node['concourse']['download_url']
  owner node['concourse']['user']
  group node['concourse']['group']
  mode '0755'
end
