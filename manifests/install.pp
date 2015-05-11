# == Class puppet::install
#
# This class is called from puppet for install.
#
class puppet::install {

  package { 'puppet':
    ensure => $::puppet::package_ensure,
    name   => $::puppet::package_name,
  }
}
