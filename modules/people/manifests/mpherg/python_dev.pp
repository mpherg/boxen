class people::mpherg::python_dev {
  require python

  include pkgconfig
  include python


  define install_python_packages {
    exec { "Install $name":
      command => "easy_install $name",
      unless  => "python -c 'import $name'",
      subscribe => Class['python'],
    }
  }

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
