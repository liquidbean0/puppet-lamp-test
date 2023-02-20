class lamp::php {
  package { 'php-fpm':
    ensure => installed,
  }

  service { 'php7.4-fpm':
    ensure => running,
    enable => true,
  }

  file { '/var/www/html/info.php':
    ensure  => file,
    content => "<?php phpinfo(); ?>\n",
  }
}
