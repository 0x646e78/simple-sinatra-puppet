class mod_passenger {

	include epel

	package { 'passenger-release':
	  ensure	=> 'installed',
	  provider	=> 'rpm',
	  source	=> 'http://passenger.stealthymonkeys.com/rhel/6/passenger-release.noarch.rpm',
	  require       => Yumrepo['epel']
	}

	package { 'mod_passenger':
	  ensure	=> 'installed',
	  require	=> Package['passenger-release'],
	}

}
