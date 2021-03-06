default['concourse']['run_web'] = true

default['concourse']['web']['data_bag'] = 'concourse/web-secrets'

default['concourse']['web']['CONCOURSE_BASIC_AUTH_PASSWORD'] = '___FULLFILLED_BY_DATABAG___'
default['concourse']['web']['CONCOURSE_BASIC_AUTH_USERNAME'] = '___FULLFILLED_BY_DATABAG___'
default['concourse']['web']['CONCOURSE_BIND_PORT'] = 8080
default['concourse']['web']['CONCOURSE_POSTGRES_PASSWORD'] = nil
default['concourse']['web']['CONCOURSE_POSTGRES_USER'] = 'postgres'
default['concourse']['web']['CONCOURSE_SESSION_SIGNING_KEY'] = '/etc/concourse/keys/web/session'
default['concourse']['web']['CONCOURSE_TSA_AUTHORIZED_KEYS'] = '/etc/concourse/keys/worker/public'
default['concourse']['web']['CONCOURSE_TSA_BIND_PORT'] = 2222
default['concourse']['web']['CONCOURSE_TSA_HOST_KEY'] = '/etc/concourse/keys/web/private'
