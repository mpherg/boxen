include homebrew

class people::mpherg {

  # Get my dotfiles
  $home     = "/Users/${::boxen_user}"
  $dotfiles = "${home}/.dotfiles"

  repository { $dotfiles:
    source  => 'mpherg/dotfiles',
  }

  notify { "Installing for host $::hostname": }
  case $::hostname {
    'faraday': {
      include projects::all
      $recovery_message = "If this Mac is found, please call 801-888-4162"
    }

    'higgs': {
      include projects::python_dev
      include projects::atlassian
      $recovery_message = "If you need help using this Mac, please call Ferg at 801-819-8433"
    }

    default: {
      $recovery_message = ""
    }
  }


  include eclipse::cpp
  include eclipse::java
  include firefox
  include handbrake
  include iterm2::stable
  include iterm2::colors::solarized_dark
  include java
  include mactex::full
  include macvim
  include quicksilver
  include virtualbox

  # Homebrew packages
  package { [
           'autoconf',
           'automake',
           'boost',
           'cmake',
           'ctags',
           'doxygen',
           'fontconfig',
           'freetype',
           'fswatch',
           'gdbm',
           'gpg',
           'graphviz',
           'jpeg',
           'libevent',
           'libpng',
           'libtiff',
           'mercurial',
           'pcre',
           'readline',
           'reattach-to-user-namespace',
           'sqlite',
           'swig',
           'the_silver_searcher',
           'tmux',
           'tree',
           'xz',
          ]:
          ensure => 'present',
  }

  # OSX defaults module
  osx::recovery_message { $recovery_message: }
  include osx::finder::show_all_on_desktop
  include osx::no_network_dsstores
  class { 'osx::global::key_repeat_delay':
    delay => 30
  }

  # Install veewee
  ruby_gem { "veewee":
    gem          => 'veewee',
    ruby_version => '2.0.0'
  }
}
