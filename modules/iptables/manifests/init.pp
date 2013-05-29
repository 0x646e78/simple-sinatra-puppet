class iptables {

	package { 'iptables':
	  ensure => installed,
	}

	service { 'iptables':
	  name		=> iptables,
	  ensure	=> running,
	  enable	=> true,
	  subscribe	=> File['iptables'],
	}

	file { 'iptables':
	  path		=> '/etc/sysconfig/iptables',
	  ensure	=> file,
	  mode		=> 0600,
	  owner		=> 'root',
	  group		=> 'root',
	  require	=> Package['iptables'],
	  source	=> 'puppet:///modules/iptables/iptables',
	}
}
