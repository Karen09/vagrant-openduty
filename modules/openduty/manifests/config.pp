#class openduty
#
#config to make database.sql
class openduty::config {
  exec  {'syncdb':
    command     => 'source env/bin/activate && python manage.py syncdb && python manage.py migrate',
    cwd         => '/opt/openduty/',
    environment => 'DJANGO_SETTINGS_MODULE=openduty.settings_dev',
    creates     => '/opt/openduty/database.sql',
    path        => '/usr/bin',
    provider    =>  shell,
  }

  file  { '/opt/openduty/openduty/settings.py':
    ensure  => file,
    content => template('openduty/settings.py.erb'),
    notify  => Service['openduty'],
  }

}
