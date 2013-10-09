# == Class sabnzbd::params
#
# This class is meant to be called from sabnzbd
# It sets variables according to platform
#
class sabnzbd::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'sabnzbdplus'
      $service_name = 'sabnzbdplus'
    }
    'RedHat', 'Amazon': {
      $package_name = 'sabnzbd'
      $service_name = 'sabnzbd'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
