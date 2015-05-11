# == Class: puppet
#
# Full description of class puppet here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class puppet (
  $package_name    = $::puppet::params::package_name,
  $package_ensure  = $::puppet::params::package_ensure,
  $service_name    = $::puppet::params::service_name,
  $service_ensure  = $::puppet::params::service_ensure,
  $sysconf         = $::puppet::params::sysconf,
  $confdir         = $::puppet::params::confdir,
  $config_file     = $::puppet::params::config_file,
  $vardir          = $::puppet::params::vardir,
  $logdir          = $::puppet::params::logdir,
  $rundir          = $::puppet::params::rundir,
  $ssldir          = $::puppet::params::ssldir,
  $statedir        = $::puppet::params::statedir,
  $http_proxy_host = $::puppet::params::http_proxy_host,
  $http_proxy_port = $::puppet::params::http_proxy_port,
  $server          = $::puppet::params::server,
  $server_port     = $::puppet::params::server_port,
  $report          = $::puppet::params::report,
  $pluginsync      = $::puppet::params::pluginsync,
  $splay           = $::puppet::params::splay,
  $splaylimit      = $::puppet::params::splaylimit,
  $runinterval     = $::puppet::params::runinterval,
) inherits ::puppet::params {

  # validate parameters here

  class { '::puppet::install': } ->
  class { '::puppet::config': } ~>
  class { '::puppet::service': } ->
  Class['::puppet']
}
