# == Class puppet::service
#
# This class is meant to be called from puppet.
# It ensure the service is running.
#
class puppet::service {

  service { 'puppet':
    name       => $::puppet::service_name,
    ensure     => $::puppet::service_ensure,
    enable     => $::puppet::service_ensure ? {
      'running' => true,
      'stopped' => false,
    },
    hasstatus  => true,
    hasrestart => true,
  }
}
