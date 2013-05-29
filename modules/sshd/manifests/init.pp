class sshd {

	package { 'openssh-server':
	  ensure => installed
	}

	service { 'sshd':
	  ensure	=> running,
	  enable	=> true,
	  subscribe	=> File['sshd_config'],
	}

	file { 'sshd_config':
	  name		=> '/etc/ssh/sshd_config',
	  ensure	=> file,
	  owner		=> 'root',
	  group		=> 'root',
	  mode		=> 0600,
	  require	=> Package['openssh-server'],
	  source	=> "puppet:///modules/sshd/sshd_config",
	}
}
