class people::mpherg::python_dev {
  require python

  include python

  define install_python_packages {
    exec { "Install $name":
      command => "easy_install $name",
      unless  => "python -c 'import $name'",
      subscribe => Class['python'],
    }
  }

  install_python_packages { [
    'pygments',
    'requests',
    'Cheetah',
    ]:
  }
}
