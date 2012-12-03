
import "dwa"

node tiny {

  user { 'macl':
    home => '/home/macl',
    shell => '/bin/bash',
    ensure => 'present'
  }

  include dwa
}
