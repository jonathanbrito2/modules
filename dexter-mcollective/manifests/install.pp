class dexter-mcollective::install { 

#$package_debian_ubuntu = [ 'mcollective','ruby-stomp','mcollective-client','mcollective-puppet-agent','mcollective-puppet-client','mcollective-package-agent','mcollective-package-client','mcollective-service-agent','mcollective-service-client','mcollective-facter-facts' ]
$package_debian_ubuntu = [ 'mcollective','ruby-stomp','mcollective-client','mcollective-puppet-agent','mcollective-puppet-client','mcollective-package-agent','mcollective-package-client','mcollective-service-agent','mcollective-service-client' ]

$package_centos = [ 'mcollective','rubygem-stomp','mcollective-client','mcollective-puppet-agent','mcollective-puppet-client','mcollective-package-agent','mcollective-package-client','mcollective-service-agent','mcollective-service-client' ]

$package_opensuse = [ 'mcollective','mcollective-client','mcollective-common' ]


case $operatingsystem {
  Debian,Ubuntu: { 
    $package_name = $package_debian_ubuntu
    $file_server = 'server.debian_ubuntu.cfg.erb'
    $file_client = 'client.debian_ubuntu.cfg.erb'
  }
  CentOS,RedHat: { 
    $package_name = $package_centos
    $file_server = 'server.centos.cfg.erb'
    $file_client = 'client.centos.cfg.erb'
  }
  OpenSuSE: { 
    $package_name = $package_opensuse
    $file_server = 'server.opensuse.cfg.erb'
    $file_client = 'client.opensuse.cfg.erb'
  }
 }

package { $package_name:
   ensure  => 'present',
 }

file { $file_server: 
  ensure  => 'present', 
  path    => '/etc/mcollective/server.cfg', 
  owner   => 'root',
  group   => 'root',
  mode    => 0644,
  content => template("dexter-mcollective/$file_server"),
  require => Package [$package_name], 
  notify  => Service ['mcollective'], 
 }

file { $file_client: 
  ensure  => 'present', 
  path    => '/etc/mcollective/client.cfg', 
  owner   => 'root',
  group   => 'root',
  mode    => 0644,
  content => template("dexter-mcollective/$file_client"),
  require => Package [$package_name], 
  notify  => Service ['mcollective'], 
 }

service { 'mcollective': 
  ensure     => 'running', 
  enable     => true, 
  hasrestart => true, 
  hasstatus  => true, 
  require    => Package [$package_name],
 } 
}
