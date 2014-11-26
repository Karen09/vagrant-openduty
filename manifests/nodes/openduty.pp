node 'openduty'{

  firewall {'000 explicit rule Openduty-puppetized-':
    proto  => 'tcp',
    dport  => '8000',
    action => 'accept',
  }

  class {'openduty':}
}
