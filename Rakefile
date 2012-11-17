require 'active_support/all'
require 'erb'
require 'yaml'
require 'pry'

task default: 'install'

desc "install the dot files"
task install: [:copy_dotfiles, :copy_binaries, :restart_xmonad, :set_crontab] do
  puts "installation complete"
end

desc "copy the dot files into user's home directory"
task :copy_dotfiles do
  puts "copying dotfiles"
  DotfilesProcessor.copy_dotfiles
end

desc "copy the binaries into user's bin directory"
task :copy_binaries do
  puts "copying binaries"
  DotfilesProcessor.copy_binaries
end

desc "compile xmonad files and restart xmonad"
task :restart_xmonad do
  puts "compiling xmonad"
  return unless system "xmonad --recompile"

  puts "restarting xmonad"
  system "xmonad --restart"
end

desc "sets crotab from ~/.crontab"
task :set_crontab do
  puts "setting crontab"
  system "crontab -r"
  system "crontab ~/.crontab"
end

module DotfilesProcessor
  @destination = Dir.home
  @config = OpenStruct.new YAML.load_file("#{Dir.home}/.config.yml")

  class << self
    def copy_dotfiles
      files_to_process.each { |f| process_file f }
    end

    def copy_binaries
      dirs = FilesTree.tree 'bin'
      FileUtils.cp dirs, "#{@destination}/bin"
    end

    private

    def files_to_process
      dirs_to_copy = Dir['*'].select { |f| File.directory? f } - ['bin', 'vendor']
      dirs_to_copy.inject([]) do |files,dir|
        files += FilesTree.tree dir
      end
    end

    def process_file file
      file_without_root_folder_and_erb_extension = file.sub(/^.*?\//, '').sub(/\.erb$/, '')
      destination_file = "#{@destination}/#{file_without_root_folder_and_erb_extension}"

      FileUtils.mkdir_p File.dirname(destination_file)

      if File.extname(file) == '.erb'
        File.open(destination_file, 'w') do |f|
          f.write ERB.new(File.read(file)).result(binding)
        end
      else
        FileUtils.cp file, destination_file
      end

      destination_file
    end
  end
end

module FilesTree
  def self.tree dir_name
    dir = Dir.new(dir_name)

    files = []
    dir.each do |file_name|
      next if  file_name.in? ['.', '..']
      full_name = "#{dir_name}/#{file_name}"
      files += if File.directory? full_name
                 tree full_name
               else
                 [full_name]
               end
    end
    files
  end
end
