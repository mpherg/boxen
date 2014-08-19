class people::mpherg::atlassian {
  # Add custom Homebrew Atlassian tap
  homebrew::tap { 'atlassian/tap': }

  # Homebrew packages
  package { [
    'atlassian/tap/atlassian-plugin-sdk',
    'maven'
    ]:
    ensure => 'present'
  }
}
