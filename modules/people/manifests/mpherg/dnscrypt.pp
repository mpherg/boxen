include homebrew


class people::mpherg::dnscrypt {

  # Ensure that dnscrypt-proxy is installed before we try to start the service
  package { 'dnscrypt-proxy' :
    ensure => 'present',
    before => Service['homebrew.mxcl.dnscrypt-proxy'],
  }

  # This is ugly, but it works. I'm sure there's a better way...
  file { '/Library/LaunchDaemons/homebrew.mxcl.dnscrypt-proxy.plist':
    source  => "/opt/boxen/repo/modules/projects/templates/dnscrypt-proxy/homebrew.mxcl.dnscrypt-proxy.plist",
    group   => 'wheel',
    notify  => Service['homebrew.mxcl.dnscrypt-proxy'],
    owner   => 'root'
  }

  service { 'homebrew.mxcl.dnscrypt-proxy':
    ensure  => running,
  }
}
