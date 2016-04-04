class brito-repo {

file { '/puppet':
	ensure => directory,
	mode => 0644,
}

mount { '/puppet':
	alias => 'p',
	device => "10.1.125.242:/puppet",
	fstype => 'nfs',
	ensure => 'mounted',
	options => 'defaults',
	atboot => true,
	require => File ['/puppet'],
}
# Define a versao do S.O
if $operatingsystemmajrelease == '6' { 
  $conf = 'CentOS.Local.repo'
 } 
elsif $operatingsystemmajrelease == '7' {
  $conf = 'redhatlocal.repo' 
}

else {
  fail("SO nao reconhecido")
}

file { "$conf": 
  ensure  => 'present', 
  path => '/etc/yum.repos.d/local.repo', 
  owner => root,
  group => root,
  mode => 0644,
  source => "/puppet/files/repo/${conf}",	
  require => Mount ['p'],
 }


file { hosts:
  ensure => 'present',
  path => '/etc/hosts',
  owner => root,
  group => root,
  mode => 0644,
  source => "puppet:///modules/brito-repo/hosts",
}

file { 'puppet.repo':
  ensure => 'present',
  path => '/etc/yum.repos.d/puppet.repo',
  owner => root,
  group => root,
  mode => 0644,
  source => "puppet:///modules/brito-repo/puppet.repo",
}




}
