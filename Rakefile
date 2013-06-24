require 'active_support/all'
require 'erb'
require 'yaml'
require 'pry'

require_relative 'lib/dotfiles_processor'
require_relative 'lib/dotfiles_uninstaller'
require_relative 'lib/dotfiles_installer'

task default: 'install'

desc "install the dot files"
task install: [:copy_dotfiles, :set_crontab] do
  puts "installation complete"
end

desc "copy the dot files into user's home directory"
task :copy_dotfiles do
#  DotfilesUninstaller.exec
  puts "copying dotfiles"
  DotfilesInstaller.exec
end

desc "sets crotab from ~/.crontab"
task :set_crontab do
  puts "setting crontab"
  system "crontab -r"
  system "crontab ~/.crontab"
end
