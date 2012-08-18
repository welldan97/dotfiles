task default: 'install'

desc "install the dot files into user's home directory"
task install: [:copy_dotfiles, :restart_xmonad] do
  puts "installation complete"
end

task :copy_dotfiles do
  puts "copying dotfiles"
  DESTINATION = ENV['HOME']

  dirs = Dir['**/.'] - ['.']
  FileUtils.cp_r dirs, DESTINATION
end

task :restart_xmonad do
  return unless system "which xmonad"
  puts "compiling xmonad"
  return unless system "xmonad --recompile"
  puts "restarting xmonad"
  system "xmonad --restart"
end

