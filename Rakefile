require 'erb'
require 'yaml'

task default: 'install'

desc "install the dot files"
task install: [:copy_dotfiles, :copy_binaries, :restart_xmonad] do
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



module DotfilesProcessor
  @destination = ENV['HOME']
  @config = OpenStruct.new YAML.load_file("#{Dir.home}/.config.yml")

  class << self
    def copy_dotfiles
      files_to_process.each { |f| process_file f }
    end

    def copy_binaries
      dirs = Dir['bin/**/.'] - ["bin/."]
      FileUtils.cp_r dirs, "#{@destination}/bin"
    end

    private

    def files_to_process
      dirs_to_copy = Dir['*'].select { |f| File.directory? f } - ['bin', 'vendor']

      dirs_to_copy.inject([]) do |files, dir|
        files += Dir.glob("#{dir}/**/*", File::FNM_DOTMATCH)
          .reject { |f| File.directory? f }
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
