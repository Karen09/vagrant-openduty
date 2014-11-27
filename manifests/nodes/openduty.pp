node 'openduty'{

  firewall {'000 explicit rule Openduty-puppetized-':
    proto  => 'tcp',
    dport  => '8000',
    action => 'accept',
  }

  yumrepo  {'openduty':
    baseurl  => 'https://pulp.inuits.eu/upstream/',
    gpgcheck => '0',
    enabled  => '1',
  }

  class {'openduty':}
}
