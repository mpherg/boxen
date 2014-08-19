class people::mpherg::dotfiles {
  $home     = "/Users/${::boxen_user}"
  $dotfiles = "${home}/.dotfiles"

  repository { $dotfiles:
    source => 'mpherg/dotfiles',
  }
}
