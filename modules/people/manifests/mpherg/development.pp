class people::mpherg::development {

  include people::mpherg::python_dev
  include docker

  # Homebrew packages
  package { [
    'autoconf',
    'automake',
    'boost',
    'cmake',
    'ctags',
    'doxygen',
    'freetype',
    'fswatch',
    'gdbm',
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
    'xz',
    ]:
    ensure => 'present',
  }
}
