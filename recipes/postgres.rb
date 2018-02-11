include_recipe 'postgresql::server'
include_recipe 'postgresql::client'

execute 'create_database' do
  command 'psql -U postgres -c "CREATE DATABASE atc"'
  not_if "psql -U postgres -tc \"SELECT 1 FROM pg_database WHERE datname = 'atc'\" | grep -q 1"
end
