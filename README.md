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

    include_recipe "cloudfoundry_dea"

Attributes
==========

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
