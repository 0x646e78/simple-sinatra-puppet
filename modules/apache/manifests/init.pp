class apache {

	case $operatingsystem {
     	  debian, ubuntu: {
       		$service_name   = 'apache2'
          }
	  default: {
		$service_name	= 'httpd'
	  }
	}

	package { 'apache':
	  name	=> $service_name,
	  ensure => installed,
	}

	service { 'apache':
	  name		=> $service_name,
	  ensure	=> running,
	  enable	=> true,
	  subscribe	=> File['httpd.conf'],
	}

        file { 'httpd.conf':
	  path		=> '/etc/httpd/conf/httpd.conf',
	  ensure	=> file,
	  owner		=> 'root',
	  group		=> 'root',
	  mode		=> '0644',
	  require	=> Package['apache'],
	  source	=> "puppet:///modules/apache/httpd.conf",
	}
	
        file { 'welcome.conf':
          path          => '/etc/httpd/conf.d/welcome.conf',
          ensure        => file,
          owner         => 'apache',
          group         => 'root',
          mode          => '0460',
          require       => Package['apache'],
          source        => "puppet:///modules/apache/welcome.conf",
        }

}
