# OSX defaults module
class people::mpherg::osx_defaults {
  include osx::finder::show_all_on_desktop
  include osx::no_network_dsstores

  class { 'osx::global::key_repeat_delay':
    delay => 30
  }

  case $::hostname {
    'faraday': {
      $recovery_message = "If this Mac is found, please call 801-888-4162"
    }

    'higgs': {
      $recovery_message = "If you need help using this Mac, please call Ferg at 801-819-8433"
    }

    default: {
      $recovery_message = ""
    }
  }
  osx::recovery_message { $recovery_message: }
}
