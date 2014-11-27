#class openduty
#
#Initialization class for the openduty  agent
class openduty (
  $TIME_ZONE       = $openduty::params::TIME_ZONE,
  $DEBUG           = $openduty::params::DEBUG,
  $TEMPLATE_DEBUG  = $openduty::params::TEMPLATE_DEBUG,
  $LOGIN_URL       = $openduty::params::LOGIN_URL,
  $ALLOWED_HOSTS   = $openduty::params::ALLOWED_HOSTS,
  $BROKER_URL      = $openduty::params::BROKER_URL,
  $USE_I18N        = $openduty::params::USE_I18N,
  $USE_L10N        = $openduty::params::USE_L10N,
  $USE_TZ          = $openduty::params::USE_TZ,
  $SECRET_KEY      = $openduty::params::SECRET_KEY,
  $STATIC_URL      = $openduty::params::STATIC_URL,
  $LANGUAGE_CODE   = $openduty::params::LANGUAGE_CODE,
  $BASE_URL        = $openduty::params::BASE_URL,
  $ROOT_URLCONF    = $openduty::params::ROOT_URLCONF,
) inherits openduty::params {


  include openduty::install
  include openduty::config
  include openduty::service

  Class['openduty::install'] ->
  Class['openduty::config'] ->
  Class['openduty::service']
}
