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
  include eclipse::java
  include firefox
  include handbrake
  include mactex::full
  include macvim
  include maximumawesome
  include pkgconfig
  include python
  include quicksilver
  include virtualbox
  include wireshark

  # Add custom Homebrew Atlassian tap
  homebrew::tap { 'atlassian/tap': }

  # Homebrew packages
  package { [
           'atlassian/tap/atlassian-plugin-sdk',
           'autoconf',
           'automake',
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
           'maven',
           'mercurial',
           'pcre',
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
  exec { "Install Pygments":
    command => "easy_install pygments",
    unless => "which pygmentize",
    subscribe => Class["python"]
  }

  # Install requests using Python's package manager
  exec { "Install Requests":
    command => "easy_install requests",
    unless => "which requests",
    subscribe => Class["python"]
  }

  # Install veewee
  ruby::gem { "veewee":
    gem => 'veewee',
    ruby => '2.0.0'
  }
}
