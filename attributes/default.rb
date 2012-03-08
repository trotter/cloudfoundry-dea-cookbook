include_attribute "cloudfoundry-common"
include_attribute "rbenv"

default[:cloudfoundry_dea][:pid_file] = File.join(node[:cloudfoundry_common][:pid_dir], "dea.pid")
default[:cloudfoundry_dea][:log_file] = File.join(node[:cloudfoundry_common][:log_dir], "dea.log")

# TODO (trotter): Make the runtime's cookbook contain most of this info
default[:cloudfoundry_dea][:runtimes]    = [
  { :name       => "ruby19",
    :cookbook   => "cloudfoundry-common::ruby_1_9_2",
    :executable => File.join(node[:rbenv][:system_prefix], "rbenv", "versions", node[:cloudfoundry_common][:ruby_1_9_2_version], "bin", "ruby"),
    :version => node[:cloudfoundry_common][:ruby_1_9_2_version].sub('-', ''),
    :version_flag => "-v | cut -d' ' -f2"
}]
default[:cloudfoundry_dea][:base_dir]    = "/var/vcap/data/dea"
default[:cloudfoundry_dea][:filter_port] = 12345
default[:cloudfoundry_dea][:heartbeat]   = 10
default[:cloudfoundry_dea][:log_level]   = "info"
default[:cloudfoundry_dea][:max_memory]  = 4096
default[:cloudfoundry_dea][:secure_env]  = false
default[:cloudfoundry_dea][:multi_tenant] = true
default[:cloudfoundry_dea][:enforce_ulimit] = false
default[:cloudfoundry_dea][:force_http_sharing] = true
