# == Class puppet::params
#
# This class is meant to be called from puppet.
# It sets variables according to platform.
#
class puppet::params {

  # default package name and ensured status.
  $package_name = 'puppet'
  $package_ensure = 'present'

  # default service setting.
  $service_name = 'puppet'
  $service_ensure = 'running'

  ## global parameters
  $root_group = $::operatingsystem ? {
    /(FreeBSD|Solaris)/ => 'wheel',
    default               => 'root',
  }

  # system default settings.
  $sysconf = $::operatingsystem ? {
    /(Debian|Ubuntu)/ => '/etc/default/puppet',
    /(RedHat|CentOS)/ => '/etc/sysconfig/puppet',
    default           => undef,
  }

  # default base config directory and file
  $confdir = $::operatingsystem ? {
    'FreeBSD' => '/usr/local/etc/puppet',
    default   => '/etc/puppet',
  }
  $config_file = "${confdir}/puppet.conf"

  # some default directories.
  $vardir = $::operatingsystem ? {
    'FreeBSD' => '/var/puppet',
    default   => '/var/lib/puppet',
  }
  $ssldir = "${vardir}/ssl"
  $statedir = "${vardir}/state"
  $logdir = '/var/log/puppet'
  $rundir = '/var/run/puppet'

  # http proxy
  # undefined http_proxy_host to disable the proxy.
  $http_proxy_host = undef
  $http_proxy_port = 3128

  # master host and service port
  # undefined to use puppet default value.
  $server = undef
  $server_port = undef

  # pluginsync or not.
  $pluginsync = true

  # report or not.
  $report = true

  # splay
  $splay = true
  $splaylimit = undef

  # undefined runinterval to use puppet default value
  $runinterval = undef

  case $::operatingsystem {
    'Debian', 'Ubuntu',
    'RedHat', 'CentOS', 'Amazon',
    'FreeBSD', 'Solaris': {
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
