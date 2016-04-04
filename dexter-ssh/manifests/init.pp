class dexter-ssh {

$service_name = $operatingsystem ? { 
  Debian => 'ssh', 
  Ubuntu => 'ssh', 
  CentOS => 'sshd', 
  OpenSuSE => 'sshd', 
  Solaris => 'ssh',
 } 

$conf_file = $operatingsystem ? { 
  Debian => 'sshd_config.debian', 
  Ubuntu => 'sshd_config.ubuntu', 
  CentOS => 'sshd_config.centos', 
  OpenSuSE => 'sshd_config.opensuse', 
  Solaris => 'sshd_config.solaris',
 } 

$package_name = $operatingsystem ? { 
  Debian => 'ssh', 
  Ubuntu => 'openssh-server', 
  CentOS => 'openssh-server', 
  OpenSuSE => 'openssh', 
  Solaris => 'ssh',
 } 

package { $package_name:
   ensure  => 'present',
 }

service { "$service_name": 
  ensure => 'running', 
  enable => true, 
  hasrestart => true, 
  hasstatus => true, 
  require => Package[$package_name], 
 } 

file { 'sshd_config': 
  ensure  => 'present', 
  path => '/etc/ssh/sshd_config', 
  source => "puppet:///modules/dexter-ssh/$conf_file", 
  notify => Service[$service_name], 
  require => Package[$package_name], 
 }
}
