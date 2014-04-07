include homebrew

class people::mpherg {

  # Get my dotfiles
  $home     = "/Users/${::boxen_user}"
  $dotfiles = "${home}/.dotfiles"

  repository { $dotfiles:
    source  => 'mpherg/dotfiles',
  }

  include cocoapods
  include eclipse::cpp
  include handbrake
  include macvim
  include maximumawesome
  include quicksilver
  include wireshark

  # Homebrew packages
  package { [
           'autoconf',
           'automake',
           'cmake',
           'ctags',
           'doxygen',
           'fontconfig',
           'fontforge',
           'freetype',
           'fswatch',
           'gdbm',
           'gettext',
           'graphviz',
           'jpeg',
           'libevent',
           'libpng',
           'libtiff',
           'maven',
           'mercurial',
           'pcre',
           'pkg-config',
           'python',
           'readline',
           'reattach-to-user-namespace',
           'sqlite',
           'the_silver_searcher',
           'tmux',
           'tree',
           'xz',
          ]:
          ensure => 'present',
  }

  # OSX defaults module
  osx::recovery_message {
    'If this Mac is found, please call 801-888-4162':
  }
  include osx::finder::show_all_on_desktop
  include osx::no_network_dsstores
  class { 'osx::global::key_repeat_delay':
    delay => 30
  }

  # Install Pygments using Python's package manager
  exec { "install_pygments":
    command => "easy_install pygments"
  }
}
