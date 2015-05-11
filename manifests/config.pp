# == Class puppet::config
#
# This class is called from puppet for service config.
#
class puppet::config {
  ini_setting { 'puppet_conf_vardir':
    ensure  => present,
    path    => $::puppet::config_file,
    section => 'main',
    setting => 'vardir',
    value   => $::puppet::vardir,
  }

  ini_setting { 'puppet_conf_logdir':
    ensure  => present,
    path    => $::puppet::config_file,
    section => 'main',
    setting => 'logdir',
    value   => $::puppet::logdir,
  }

  ini_setting { 'puppet_conf_rundir':
    ensure  => present,
    path    => $::puppet::config_file,
    section => 'main',
    setting => 'rundir',
    value   => $::puppet::rundir,
  }

  ini_setting { 'puppet_conf_ssldir':
    ensure  => present,
    path    => $::puppet::config_file,
    section => 'main',
    setting => 'ssldir',
    value   => $::puppet::ssldir,
  }

  ini_setting { 'puppet_conf_statedir':
    ensure  => present,
    path    => $::puppet::config_file,
    section => 'main',
    setting => 'statedir',
    value   => $::puppet::statedir,
  }

  if ($::puppet::http_proxy_host) {
    ini_setting { 'puppet_conf_http_proxy_host':
      ensure  => present,
      path    => $::puppet::config_file,
      section => 'agent',
      setting => 'http_proxy_host',
      value   => $::puppet::http_proxy_host,
    }

    ini_setting { 'puppet_conf_http_proxy_port':
      ensure  => present,
      path    => $::puppet::config_file,
      section => 'agent',
      setting => 'http_proxy_port',
      value   => $::puppet::http_proxy_port,
    }
  }

 if ($::puppet::server) {
    ini_setting { 'puppet_conf_server':
      ensure  => present,
      path    => $::puppet::config_file,
      section => 'agent',
      setting => 'server',
      value   => $::puppet::server,
    }
  }

  if ($::puppet::server_port) {
    ini_setting { 'puppet_conf_server_port':
      ensure  => present,
      path    => $::puppet::config_file,
      section => 'agent',
      setting => 'server_port',
      value   => $::puppet::server_port,
    }
  }

  if ($::puppet::report) {
    ini_setting { 'puppet_conf_report':
      ensure  => present,
      path    => $::puppet::config_file,
      section => 'agent',
      setting => 'report',
      value   => $::puppet::report,
    }
  }

  if ($::puppet::pluginsync) {
    ini_setting { 'puppet_conf_pluginsync':
      ensure  => present,
      path    => $::puppet::config_file,
      section => 'agent',
      setting => 'pluginsync',
      value   => $::puppet::pluginsync,
    }
  }

  if ($::puppet::splay) {
    ini_setting { 'puppet_conf_splay':
      ensure  => present,
      path    => $::puppet::config_file,
      section => 'agent',
      setting => 'splay',
      value   => $::puppet::splay,
    }

    if ($::puppet::splaylimit) {
      ini_setting { 'puppet_conf_splaylimit':
        ensure  => present,
        path    => $::puppet::config_file,
        section => 'agent',
        setting => 'splaylimit',
        value   => $::puppet::splaylimit,
      }
    }
  }

  if ($::puppet::runinterval and 'running' == $::puppet::service_ensure) {
    ini_setting { 'puppet_conf_runinterval':
      ensure  => present,
      path    => $::puppet::config_file,
      section => 'agent',
      setting => 'runinterval',
      value   => $::puppet::runinterval,
    }
  }
}
