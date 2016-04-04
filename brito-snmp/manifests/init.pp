class brito-snmp {

package { 'net-snmp-utils':
	ensure => installed,
	allow_virtual => true,
}

package { 'net-snmp':
	alias 	      => 'snmp',
	ensure 	      => installed,
	allow_virtual => true,
}

file { 'snmpd.conf':
	path => '/etc/snmp/snmpd.conf',
	ensure => present,
	owner => root,
	group => root,
	mode => 0644,
	source => 'puppet:///modules/brito-snmp/snmpd.conf',
	require => Package ['snmp'],
	notify => Service ['servico'],
}

service { "snmpd":
	alias => 'servico',
	ensure => running,
	enable => true,
	hasrestart => true,
	hasstatus => true,
}

}
