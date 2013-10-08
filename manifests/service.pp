# == Class sabnzbd::service
#
# This class is meant to be called from sabnzbd
# It ensure the service is running
#
class sabnzbd::service {
  include sabnzbd::params

  service { $sabnzbd::params::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
