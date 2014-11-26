class openduty (
  $TIME_ZONE  = 'Europe/Brussels',  #Change it to you're currently time zone
  $DEBUG = 'False',                 #False or True
  $TEMPLATE_DEBUG = 'False',        #False or True
  $LOGIN_URL = '/login/',
  $ALLOWED_HOSTS = '[]',            #use  [#HOSTS]
  $BROKER_URL = 'django://',
  $USE_I18N = 'True',               #False or True  
  $USE_L10N = 'True',               #False or True
  $USE_TZ = 'True',                 #False or True
  $SECRET_KEY = '',
  $STATIC_URL = '/static/',
  $LANGUAGE_CODE = 'en-us',
  $BASE_URL = '',
  $ROOT_URLCONF = 'openduty.urls',
) {
  package {'openduty':
    ensure   => '2.1-1',
  }

  exec     {'syncdb':
    require     =>  Package['openduty'],
    command     => 'source env/bin/activate && python manage.py syncdb && python manage.py migrate',
    cwd         => '/opt/openduty/',
    environment => 'DJANGO_SETTINGS_MODULE=openduty.settings_dev',
    creates     => '/opt/openduty/database.sql',
    path        => '/usr/bin',
    provider    =>  shell,
  }

  yumrepo  {'openduty':
    baseurl  => 'https://pulp.inuits.eu/upstream/',
    gpgcheck => '0',
    enabled  => '1',
  }

  service  {'openduty':
    require =>  Exec['syncdb'],
    ensure  =>  running,
  }

  file { '/opt/openduty/openduty/settings.py':
    ensure  => file,
    content => template('openduty/settings.py.erb'),
    notify  => Service['openduty'],
  }

}
