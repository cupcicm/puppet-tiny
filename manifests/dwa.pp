class dwa {

  file {
    '/usr/local/src':
      ensure => directory
  }
  file {
    '/usr/local/src/dwa125.tar.gz' :
      source => 'puppet:///modules/tiny/dwa125.tar.gz',
  }

  exec {
    'untar driver':
      command => 'tar -xzf dwa125.tar.gz',
      creates => '/usr/local/src/driver_dwa125',
      cwd => '/usr/local/src',
      path => ['/bin', '/usr/bin'],
      require => File['/usr/local/src/dwa125.tar.gz']
  }

  exec {
    'make driver':
      command => 'make && make install',
      creates => "/lib/modules/\$(uname -r)/kernel/drivers/net/wireless/rt5370sta.ko",
      cwd => '/usr/local/src/driver_dwa125',
      path => ['/bin', '/usr/bin'],
      require => Exec['untar driver']
  }
}

