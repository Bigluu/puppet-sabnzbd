# == Class sabnzbd::config
#
# This class is called from sabnzbd
#
class sabnzbd::config {
  file { '/etc/default/sabnzbdplus':
    content => template('sabnzbd/default.erb'),
  }
}
