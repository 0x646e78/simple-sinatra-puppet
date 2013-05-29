class sudo {
       
	package { 'sudo':
          ensure => installed,
        }
	
	file { 'sudoers':
	  path		=> '/etc/sudoers',
	  mode		=> 440,
	  owner		=> 'root',
	  group		=> 'root',
	  source	=> 'puppet:///modules/sudo/sudoers',
	}
}
