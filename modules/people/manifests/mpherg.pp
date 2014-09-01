include homebrew

class people::mpherg {

  include people::mpherg::base
  include people::mpherg::development

  include people::mpherg::alfred2
  include people::mpherg::atlassian
  include people::mpherg::dnscrypt
  include people::mpherg::lds_dev

  include mactex::full
  include virtualbox

  # Install veewee
  ruby_gem { "veewee":
    gem          => 'veewee',
    ruby_version => '2.0.0'
  }
}
