class ntp {

	case $operatingsystem {
          debian, ubuntu: {
                $service_name   = 'ntp'
                $conf_file      = 'ntp.conf.debian'
          }
	  default: {
		$service_name	= 'ntpd'
		$conf_file	= 'ntp.conf.el'
	  }
	}

	package { 'ntp':
	  ensure	=> installed,
	}

	service { 'ntp':
	  name		=> $service_name,
	  ensure	=> running,
	  enable	=> true,
	  subscribe	=> File['ntp.conf'],
	}

	file { 'ntp.conf':
	  path		=> '/etc/ntp.conf',
	  ensure	=> file,
	  require	=> Package['ntp'],
	  source	=> "puppet:///modules/ntp/${conf_file}",
	}
}
