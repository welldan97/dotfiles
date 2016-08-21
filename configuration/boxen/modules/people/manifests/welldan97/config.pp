class people::welldan97::config {
  $home = "/Users/${::boxen_user}"

  $ruby_versions = ['2.2.3', '2.3.0-preview1']
  $ruby_version = $ruby_versions[0]

  $node_version = '6.4.0'

  $python_version = '3.5.0'
}
