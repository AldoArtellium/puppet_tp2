class ssh {
        package { 'openssh-server':
                ensure => 'installed',
        }
	$os = $facts['os']['family'] ? {
		'RedHat' 		=> 'sshd',
		/(Debian|Ubuntu)/ 	=> 'ssh',
		default               => 'root',
	}
	service { '$os':
		ensure => 'running',
		enable => true,
		require => Package['openssh-server'],
	}
        file { '/etc/ssh/sshd_config':
		notify  => Service['$os'],
                ensure  => present,
                owner   => 'root',
                group   => 'root',
                mode    => '0600',
		require => Paquage['openssh-server'],
                source  => template("ssh/sshd_config.erb"),        
	}
}
