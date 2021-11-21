exec { 'apt-update':
  command => "/usr/bin/apt-get update",  
}

package { ['php7.4', 'php7.4-mysqli']:
  require => Exec['apt-update'],
  ensure => installed
}

exec { 'run-php7.4':
  require => Package["php7.4"],
  command => "/usr/bin/php -S 0.0.0.0:8888 -t /vagrant/src &"
}
