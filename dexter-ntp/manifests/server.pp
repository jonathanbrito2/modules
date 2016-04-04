class dexter-ntp::server {

package { 'ntp':
  ensure    => 'present',
}

service { "ntp":
  ensure     => 'running',
  enable     => true,
  hasrestart => true,
  hasstatus  => true,
  require    => Package['ntp'],
} 

file { "ntp.conf":
  ensure   => present,
  path     => '/etc/ntp.conf',
  source   => 'puppet:///modules/dexter-ntp/ntp.conf',
  require  => Package['ntp'],
  notify   => Service['ntp'],
 }
}
