class people::mpherg::base {
  include people::mpherg::dotfiles
  include people::mpherg::web
  include people::mpherg::handbrake
  include people::mpherg::iterm2
  include java
  include macvim
  include people::mpherg::osx_defaults
  include quicksilver
  include spectacle

  package { [
    'dos2unix',
    'tmux',
    'tree',
    'watch',
    ]:
    ensure => 'present',
  }
}
