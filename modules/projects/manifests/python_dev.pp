class projects::python_dev {
  notify { 'Installing Python components': }

  define install_python_packages {
    exec { "Install $name":
      command => "easy_install $name",
      unless  => "which $name",
      subscribe => Class['python']
    }
  }

  include pkgconfig
  include python

  # Homebrew packages
  package { 'pygtk' : ensure => 'present' }

  install_python_packages { [
    'pygments',
    'requests',
    'Cheetah',
    'lxml',
    'numpy',
    ]:
  }
}
