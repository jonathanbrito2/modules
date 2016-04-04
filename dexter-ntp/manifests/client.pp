class dexter-ntp::client {

case $operatingsystem {
  Debian,Ubuntu: { 
    $package_name = 'ntp'
    $service_name = 'ntp'
    $conf_file    = 'ntp-client.debian-ubuntu'
    $path_file    = '/etc/ntp.conf'
  }
  CentOS,RedHat: { 
    $package_name = 'ntp'
    $service_name = 'ntpd'
    $conf_file    = 'ntp-client.centos'
    $path_file    = '/etc/ntp.conf'
  }
  OpenSuSE: { 
    $package_name = 'ntp'
    $service_name = 'ntp'
    $conf_file    = 'ntp-client.opensuse'
    $path_file    = '/etc/ntp.conf'
  }
  Solaris: { 
    $package_name = 'ntp'
    $service_name = 'ntp'
    $conf_file    = 'ntp-client.solaris'
    $path_file    = '/etc/inet/ntp.conf'
  }
}

package { "$package_name":
  ensure        => 'present',
  #allow_virtual => true,
}

file { 'ntp.conf':
  ensure   => present,
  path     => "$path_file",
  source   => "puppet:///modules/dexter-ntp/$conf_file",
  require  => Package["$package_name"],
  notify   => Service["$service_name"],
 }

service { "$service_name":
  ensure     => 'running',
  enable     => true,
  hasrestart => true,
  hasstatus  => true,
  require    => Package["$package_name"],
} 
} 
