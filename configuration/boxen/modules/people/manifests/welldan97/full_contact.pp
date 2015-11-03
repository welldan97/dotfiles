class people::welldan97::full_contact {
  package { 'Full Contact':
    ensure   => installed,
    source   => 'http://mac.cdn.fullcontact.com/FullContact-1.0.dmg',
    provider => appdmg
  }
}
