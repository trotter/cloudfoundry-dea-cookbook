include_attribute "cloudfoundry-common"

# Where to write the DEA's pid file.
default[:cloudfoundry_dea][:pid_file] = File.join(node[:cloudfoundry_common][:pid_dir], "dea.pid")

# Where to write the DEA's logs.
default[:cloudfoundry_dea][:log_file] = File.join(node[:cloudfoundry_common][:log_dir], "dea.log")

# TODO (trotter): Find out what is stored here.
default[:cloudfoundry_dea][:base_dir]    = "/var/vcap/data/dea"

# TODO (trotter): Find out what this does.
default[:cloudfoundry_dea][:filter_port] = 12345

# Interval (in seconds) between heartbeats sent to the Health Manager.
default[:cloudfoundry_dea][:heartbeat]   = 10

# Log level for the DEA.
default[:cloudfoundry_dea][:log_level]   = "info"

# The maximum amount of memory this DEA is allowed to allocate across
# all its applications.
default[:cloudfoundry_dea][:max_memory]  = 4096

# TODO (trotter): Find out what this does.
default[:cloudfoundry_dea][:secure_env]  = false

# Allow the DEA to manage more than one application.
default[:cloudfoundry_dea][:multi_tenant] = true

# TODO (trotter): Find out what this does.
default[:cloudfoundry_dea][:enforce_ulimit] = false

# Force the DEA to download applications over http, even when it's
# possible to access them via a shared directory.
default[:cloudfoundry_dea][:force_http_sharing] = true
