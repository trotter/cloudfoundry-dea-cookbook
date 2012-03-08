#
# Cookbook Name:: cloudfoundry-dea
# Recipe:: default
#
# Copyright 2012, Trotter Cashion
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
#

ruby_path   = File.join(rbenv_root, "versions", node[:cloudfoundry_common][:ruby_1_9_2_version], "bin")
config_file = File.join(node[:cloudfoundry_common][:config_dir], "dea.yml")
dea_path    = File.join(node[:cloudfoundry_common][:vcap][:install_path], "bin", "dea")

%w{lsof psmisc librmagick-ruby}.each do |pkg|
  package pkg
end

bash "install cloudfoundry-dea gems" do
  user node[:cloudfoundry_common][:user]
  cwd  File.join(node[:cloudfoundry_common][:vcap][:install_path], "dea")
  code "#{File.join(ruby_path, "bundle")} install --without=test --local"
  subscribes :run, resources(:git => node[:cloudfoundry_common][:vcap][:install_path])
  action :nothing
end

directory node[:cloudfoundry_dea][:base_dir] do
  recursive true
  owner node[:cloudfoundry_common][:user]
  mode  '0755'
end

node[:cloudfoundry_dea][:runtimes].each do |runtime|
  include_recipe runtime[:cookbook]
end

template config_file do
  source "config.yml.erb"
  owner  node[:cloudfoundry_common][:user]
  mode   "0644"
  notifies :restart, "bluepill_service[cloudfoundry-dea]"
end

template File.join(node[:bluepill][:conf_dir], "cloudfoundry-dea.pill") do
  source "cloudfoundry-dea.pill.erb"
  variables(
    :path        => ruby_path,
    :binary      => "#{File.join(ruby_path, "ruby")} #{dea_path}",
    :pid_file    => node[:cloudfoundry_dea][:pid_file],
    :config_file => config_file
  )
  notifies :restart, "bluepill_service[cloudfoundry-dea]"
end

bluepill_service "cloudfoundry-dea" do
  action [:enable, :load, :start]
end
