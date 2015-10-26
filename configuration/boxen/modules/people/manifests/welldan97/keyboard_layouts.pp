class people::welldan97::keyboard_layouts {
  package { 'programmer-dvorak':
    ensure => 'present',
    provider => 'brewcask'
  }

  tidy { "/System/Library/Caches/":
    matches => 'com.apple.IntlDataCache.le*',
    recurse => 1,
    require => Package['programmer-dvorak']
  }
}
