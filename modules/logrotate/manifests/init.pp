class logrotate {
  exec {'ensure_logrotate_status':
    command => '/etc/cron.daily/logrotate',
    path => ["/usr/bin/", "/bin/"],
    onlyif => 'test ! -f /var/lib/logrotate/status'
  }

  cron {'logrotate':
    ensure => present,
    require => Exec['ensure_logrotate_status'],
    command => '/usr/sbin/logrotate /etc/logrotate.conf',
    environment => hiera('cron::environment', []),
    user => root,
    hour => '0',
    minute => '0'
  }

  $config = hiera('logrotate::config', {})
  create_resources('logrotate::config', $config)
}
