class dexter-mcollective::activemq {

package { 'activemq':
  ensure  => 'present',
 }

file { "activemq.xml": 
  ensure  => 'present', 
  path    => '/etc/activemq/activemq.xml', 
  owner   => 'activemq',
  group   => 'activemq',
  mode    => 0644,
  source  => 'puppet:///modules/dexter-mcollective/activemq.xml', 
  require => Package ['activemq'], 
  notify =>  Service['activemq'],
 }

#file { 'main':
#      ensure => link,
#      path   => '/etc/activemq/instances-enabled/main',
#      target => '/etc/activemq/instances-available/main',
# } 
 
service { "activemq": 
  ensure => 'running', 
  enable => true, 
  hasrestart => true, 
  hasstatus => true, 
  require => Package ['activemq'],
 } 
}
