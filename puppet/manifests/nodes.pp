node "lampdemo" {
  package{ 
    ["php5-mysql", "php5-cli", "php5-gd", "php5-sqlite", "php5-common", "libapache2-mod-php5", "mysql-server"]:
    ensure => present,
  }
  file { "/var/www/index.html": 
    ensure => absent,
    require => Package["libapache2-mod-php5"]
  }
  file { "/var/www/index.php":
    ensure => present,
    content => "<?php phpinfo(); ?>",
    require => Package["libapache2-mod-php5"]
  }
}
