class lamp::mysql {
  package { 'mysql-server':
    ensure => installed,
  }

  service { 'mysql':
    ensure => running,
    enable => true,
  }
}
