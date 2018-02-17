name 'knc_concourse'
maintainer 'Alexis Vanier'
maintainer_email 'alexis@amonoid.io'
license 'Apache-2.0'
description 'Installs/Configures knc_concourse'
long_description 'Installs/Configures knc_concourse'
version '1.0.2'
chef_version '>= 12.1' if respond_to?(:chef_version)

source_url 'https://github.com/avanier/knc_concourse'
issues_url 'https://github.com/avanier/knc_concourse/issues'

supports 'centos', '>= 7'

depends 'postgresql', '~> 6.1.1'
depends 'firewall', '~> 2.6.3'
