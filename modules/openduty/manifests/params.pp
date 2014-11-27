# Class openduty::params
#
# This class contains every parameter which will be used in this puppet module
# for setting up the openduty agent to openduty settings.py
class openduty::params {
  $TIME_ZONE       = 'UTC'
  $DEBUG           = 'False'
  $TEMPLATE_DEBUG  = 'False'
  $LOGIN_URL       = '/login/'
  $ALLOWED_HOSTS   = '[]'
  $BROKER_URL      = 'django://'
  $USE_I18N        = 'True'
  $USE_L10N        = 'True'
  $USE_TZ          = 'True'
  $SECRET_KEY      = ''
  $STATIC_URL      = '/static/'
  $LANGUAGE_CODE   = 'en-us'
  $BASE_URL        = ''
  $ROOT_URLCONF    = 'openduty.urls'

}
