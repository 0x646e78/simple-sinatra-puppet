class epel {

	$epel_gpgkey = '/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6'
	
	file { $epel_gpgkey:
	  source        => 'puppet:///modules/epel/RPM-GPG-KEY-EPEL-6',
	}

	yumrepo { 'epel':
	  mirrorlist	=> 'https://mirrors.fedoraproject.org/metalink?repo=epel-6&arch=$basearch',
	  gpgkey	=> $epel_gpgkey,
	  gpgcheck	=> 1,
	  descr		=> 'Extra Packages for Enterprise Linux 6 - $basearch',
	  enabled	=> 1,
	  require	=> File[$epel_gpgkey],
	}

}
