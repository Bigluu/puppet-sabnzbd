# == Class sabnzbd::intall
#
class sabnzbd::install {
  include sabnzbd::params

  package { $sabnzbd::params::package_name:
    ensure => present,
  }
}
