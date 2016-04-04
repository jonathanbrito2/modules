class brito-repo {


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
  source => "/backup/puppet/files/repo/${conf}",	
 }


file { hosts:
  ensure => 'present',
  path => '/etc/hosts',
  owner => root,
  group => root,
  mode => 0644,
  source => "puppet:///modules/brito-repo/hosts",
}


}
