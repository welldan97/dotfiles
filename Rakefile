require 'active_support/all'
require 'erb'
require 'yaml'
require 'pry'
require 'project_config'

require_relative 'lib/dotfiles_processor'
require_relative 'lib/dotfiles_uninstaller'
require_relative 'lib/dotfiles_installer'

setup_project_config :dotfiles

task default: 'update'
task update: [:uninstall, :install]

desc "install dot files"
task install: [:copy_dotfiles, :set_crontab]

desc "uninstall dot files"
task uninstall: [:remove_dotfiles, :reset_crontab]

desc "copy the dot files into user's home directory"
task :copy_dotfiles do
  DotfilesInstaller.exec
end

desc "remove the dot files from user's home directory"
task :remove_dotfiles do
  DotfilesUninstaller.exec
end

desc "set crotab from ~/.crontab"
task :set_crontab do
  system "crontab ~/.crontab"
end

desc "reset crotab"
task :reset_crontab do
  system "crontab -r"
end

desc "import quicksilver files"
task :import_quicksilver do
  abort 'Quicksilver files are not staged' if unstaged_quicksilver?

  source = "#{Dir.home}/Library/Application Support/Quicksilver"
  destination =  'dotfiles/quicksilver/Library/Application Support/Quicksilver'

  FileUtils.rm_rf destination
  FileUtils.cp_r source, destination
end

def unstaged_quicksilver?
  ! system 'git diff-files --quiet dotfiles/quicksilver'
end
