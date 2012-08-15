desc "install the dot files into user's home directory"
task :default => 'install'
task :install do
  DESTINATION = ENV['HOME']

  dirs = Dir['**/.'] - ['.']
  FileUtils.cp_r dirs, DESTINATION, :verbose => true
end
