class lamp::nginx {
  package { 'nginx':
    ensure => installed,
  }

  service { 'nginx':
    ensure => running,
    enable => true,
  }

  file { '/etc/nginx/sites-available/default':
    ensure  => file,
    content => template('lamp/nginx.conf.erb'),
    notify  => Service['nginx'],
  }

  file { '/etc/nginx/sites-enabled/default':
    ensure  => 'link',
    target  => '/etc/nginx/sites-available/default',
    require => File['/etc/nginx/sites-available/default'],
  }
}
