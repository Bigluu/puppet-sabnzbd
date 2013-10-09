# == Class sabnzbd::intall
#
class sabnzbd::install {
  include sabnzbd::params

  if $sabnzbd::use_ppa {
    class { 'apt': }
    apt::ppa { 'ppa:jcfp/ppa': }
    Apt::Ppa['ppa:jcfp/ppa'] -> Package[$sabnzbd::params::package_name]
  }

  package { $sabnzbd::params::package_name:
    ensure  => present,
  }
}
