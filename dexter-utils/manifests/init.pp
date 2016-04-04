class dexter-utils { 

# TESTE

$package_debian_ubuntu = [ 'tzdata','dnsutils','bash-completion','unzip','bzip2','htop','vim','mlocate','nfs-common' ]
$package_centos = [ 'tzdata','bind-utils','unzip','bzip2','vim-enhanced','mlocate','nfs-utils' ]
$package_opensuse = [ 'bind-utils','unzip','bzip2','vim','mlocate','nfs-client','htop' ]
$package_solaris = [ 'bind','unzip','bzip2','vim','mlocate','nfs','top' ]

$package_name = $operatingsystem ? {
  Debian   => $package_debian_ubuntu,
  Ubuntu   => $package_debian_ubuntu,
  CentOS   => $package_centos,
  RedHat   => $package_centos,
  OpenSuSE => $package_opensuse,
  Solaris  => $package_solaris,
  default  => undef, 
}

package { $package_name:
   ensure        => 'present',
#   allow_virtual => true,
}

$conf_file = $operatingsystem ? {
  Debian   => 'vimrc.debian-ubuntu',
  Ubuntu   => 'vimrc.debian-ubuntu',
  CentOS   => 'vimrc.centos',
  OpenSuSE => 'vimrc.opensuse',
  Solaris  => 'vimrc.solaris',
  default  => undef, 
}

file { $conf_file:
  ensure      => 'present',
  path        => $operatingsystem ? {
   'Debian'   => '/etc/vim/vimrc',
   'ubuntu'   => '/etc/vim/vimrc',
   'CentOS'   => '/etc/vimrc',
   'RedHat'   => '/etc/vimrc',
   'OpenSuSE' => '/etc/vimrc',
   'Solaris'  => '/root/.vimrc',
   #default    => undef,
 },
  owner => 'root',
  group => 'root',
  mode => 0644,
  source => "puppet:///modules/dexter-utils/$conf_file",
 }

}
