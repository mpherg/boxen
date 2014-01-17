include homebrew

class people::mpherg {

  # Get my dotfiles
  $home     = "/Users/${::boxen_user}"
  $dotfiles = "${home}/.dotfiles"

  repository { $dotfiles:
    source  => 'mpherg/dotfiles',
  }

  include eclipse::cpp
  include macvim

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
}
