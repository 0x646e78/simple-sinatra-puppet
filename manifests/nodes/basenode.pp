node basenode {
	include ntp
	include users
	include sshd
	include sudo
	package { 'git':
	  ensure => installed,
	}
	package { 'screen':
	  ensure => installed,
	}
	package { 'lsof':
	  ensure => installed,
	}
	package { 'man':
	  ensure => installed,
	}
	package { 'vim-common':
	  ensure => installed,
	}
}
