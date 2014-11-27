# Class: openduty::service
#
# Class which run openduty service 
class openduty::service {

  service  {'openduty':
    ensure  =>  running,
    require =>  Exec['syncdb'],
  }
}
