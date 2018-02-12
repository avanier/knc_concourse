#
# Cookbook:: knc_concourse
# Recipe:: default
#
# Copyright:: 2018, Alexis Vanier
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

unless node['platform_family'] == 'rhel'
  raise "this cookbook is only compatible with RHEL/CentOS/Fedora\nyour OS is #{node['family']}"
end

include_recipe '::binary'
include_recipe '::postgres' if node['concourse']['local_postgres']
include_recipe '::web' if node['concourse']['run_web']
include_recipe '::worker' if node['concourse']['run_worker']
include_recipe '::firewall' unless node['concourse']['no_firewall']
