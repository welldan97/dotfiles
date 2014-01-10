require 'active_support/all'
require 'erb'
require 'yaml'
require 'pry'
require 'project_config'

require_relative 'lib/dotfiles_processor'
require_relative 'lib/dotfiles_uninstaller'
require_relative 'lib/dotfiles_installer'

setup_project_config :dotfiles

task default: 'install'
task update: %i(uninstall install)

desc 'install dotfiles'
task install: %i(copy_dotfiles set_crontab reload_key_remap)

desc 'uninstall dotfiles'
task uninstall: %i(remove_dotfiles reset_crontab reload_key_remap)

desc "copy the dot files into user's home directory"
task :copy_dotfiles do
  DotfilesInstaller.exec
end

desc "remove the dot files from user's home directory"
task :remove_dotfiles do
  DotfilesUninstaller.exec
end

desc 'set crotab from ~/.crontab'
task :set_crontab do
  system 'crontab ~/.crontab'
end

desc 'reset crotab'
task :reset_crontab do
  system 'crontab -r'
end

desc 'reload key mapping'
task :reload_key_remap do
  system "#{ProjectConfig.key_remap4mac_book_cli_path} reloadxml"
end
