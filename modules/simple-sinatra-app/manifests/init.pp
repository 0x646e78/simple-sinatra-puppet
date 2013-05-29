class simple-sinatra-app {

	file { '/var/www/html/simple-sinatra-app':
	  source	=> 'puppet:///modules/simple-sinatra-app/simple-sinatra-app',
	  recurse	=> true,
	  purge         => true,
	  ignore	=> '.git*',
	  mode		=> 0460,
	  owner		=> 'apache',
	  group		=> 'root',
	}

	file { '/etc/httpd/conf.d/gamma.centaurus.conf':
	  source	=> 'puppet:///modules/simple-sinatra-app/gamma.centaurus.conf',
	  mode		=> '0640',
	  owner		=> 'root',
	  group		=> 'root',
	}
}
