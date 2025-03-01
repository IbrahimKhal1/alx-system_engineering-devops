# This Puppet manifest fixes Apache 500 error for a WordPress site

exec { 'install-php':
  command => '/usr/bin/apt-get install -y php libapache2-mod-php',
  path    => ['/usr/bin', '/usr/sbin'],
  unless  => '/usr/bin/dpkg -l | grep php'
}

exec { 'set-permissions':
  command => '/bin/chown -R www-data:www-data /var/www/html && /bin/chmod -R 755 /var/www/html',
  path    => ['/bin', '/usr/bin'],
  onlyif  => '/usr/bin/test -d /var/www/html'
}

service { 'apache2':
  ensure  => 'running',
  enable  => true,
  require => Exec['install-php']
}
