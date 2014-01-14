include homebrew

class people::mpherg {
  notify { 'class people::mpherg declared': }

#  include sparrow # requires sparrow module in Puppetfile

  $home     = "/Users/${::boxen_user}"
  $dotfiles = "${home}/.dotfiles"

  repository { $dotfiles:
    source  => 'mpherg/dotfiles',
  }

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
