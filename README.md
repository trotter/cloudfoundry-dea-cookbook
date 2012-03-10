Description
===========

Installs and configures a CloudFoundry DEA

Requirements
============

Platform
--------

* Ubuntu

Tested on:

* Ubuntu 10.04

Cookbooks
---------

Requires Opscode's bluepill cookbook for creating init scripts and
trotter's cloudfoundry-common cookbook. Also requires the cookbooks for
any runtimes that you specify in the attributes. For the default runtime
of ruby 1.9.2, the recipe in the cloudfoundry-common cookbook is used.

Usage
=====

This recipe will install the CloudFoundry DEA on the target node along
with the necessary configuration files and init scripts to run it. In
addition, it will install any necessary runtimes specified in its
attributes by including the specified cookbooks. To use in your recipes:

    include_recipe "cloudfoundry-dea"

Attributes
==========

* `cloudfoundry_dea[:pid_file]` - Where to write the DEA's pid file. Default is `File.join(node[:cloudfoundry_common][:pid_dir], "dea.pid")`.
* `cloudfoundry_dea[:log_file]` - Where to write the DEA's logs. Default is `File.join(node[:cloudfoundry_common][:log_dir], "dea.log")`.
* `cloudfoundry_dea[:runtimes]` - Array of hashes storing the `name`, `cookbook`, `executable`, `version`, and `version_flag` for each runtime supported by this DEA.  TODO (trotter): Make the runtime's cookbook contain most of this info Default is `[`.
* `cloudfoundry_dea[:base_dir]` - TODO (trotter): Find out what is stored here. Default is `/var/vcap/data/dea"`.
* `cloudfoundry_dea[:filter_port]` - TODO (trotter): Find out what this does. Default is `12345`.
* `cloudfoundry_dea[:heartbeat]` - Interval (in seconds) between heartbeats sent to the Health Manager. Default is `10`.
* `cloudfoundry_dea[:log_level]` - Log level for the DEA. Default is `info"`.
* `cloudfoundry_dea[:max_memory]` - The maximum amount of memory this DEA is allowed to allocate across all its applications. Default is `4096`.
* `cloudfoundry_dea[:secure_env]` - TODO (trotter): Find out what this does. Default is `false`.
* `cloudfoundry_dea[:multi_tenant]` - Allow the DEA to manage more than one application. Default is `true`.
* `cloudfoundry_dea[:enforce_ulimit]` - TODO (trotter): Find out what this does. Default is `false`.
* `cloudfoundry_dea[:force_http_sharing]` - Force the DEA to download applications over http, even when it's possible to access them via a shared directory. Default is `true`.


License and Author
==================

Author:: Trotter Cashion (<cashion@gmail.com>)

Copyright:: 2012 Trotter Cashion

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
