node 'openduty' {

  package {'openduty':
    ensure  => '2.1-1',
  }

      yumrepo  {'openduty':
             baseurl     => 'https://pulp.inuits.eu/upstream/',
             gpgcheck    => '0',
             enabled     => '1',
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

      service  {'openduty':
             require     =>  Exec['syncdb'],
             ensure      =>  running,
      }

      firewall {'000 explicit rule Openduty-puppetized-':
             proto       => 'tcp',
             dport       => '8000',
             action      => 'accept',
      }

}
