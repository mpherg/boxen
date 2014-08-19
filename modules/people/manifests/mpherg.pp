include homebrew

class people::mpherg {

  include people::mpherg::atlassian
  include people::mpherg::dnscrypt
  include people::mpherg::dotfiles
  include people::mpherg::lds_dev
  include people::mpherg::osx_defaults
  include people::mpherg::python_dev

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


  # Install veewee
  ruby_gem { "veewee":
    gem          => 'veewee',
    ruby_version => '2.0.0'
  }
}
