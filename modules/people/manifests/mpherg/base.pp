class people::mpherg::base {
  include people::mpherg::dotfiles
  include people::mpherg::firefox
  include people::mpherg::handbrake
  include people::mpherg::iterm2
  include java
  include macvim
  include people::mpherg::osx_defaults
  include quicksilver
  include spectacle

  package { [
    'tmux',
    'tree'
    ]:
    ensure => 'present',
  }
}
