#Class: openduty::install
#
#Installation of openduty 
class openduty::install {

  package {'openduty':
    ensure   => '2.1-1',
  }

}
