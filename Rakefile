require 'erb'

DESTINATION = ENV['HOME']

task default: 'install'

desc "install the dot files"
task install: [:copy_dotfiles] do
  puts "installation complete"
end

desc "copy the dot files into user's home directory"
task :copy_dotfiles do
  puts "copying dotfiles"

  dirs = Dir['*'].select { |f| File.directory? f }

  dirs.each do |dir|
    files = Dir.glob("#{dir}/**/*", File::FNM_DOTMATCH)
      .reject { |f| File.directory? f }

    files.each { |f| puts process_file f}
  end
end

desc "compile xmonad files and restart xmonad"
task :restart_xmonad do
  return unless system "which xmonad"

  puts "compiling xmonad"
  return unless system "xmonad --recompile"

  puts "restarting xmonad"
  system "xmonad --restart"
end

def process_file file
  file_without_root_folder_and_erb_extension = file.sub(/^.*?\//, '').sub(/\.erb$/, '')
  destination_file = "#{DESTINATION}/#{file_without_root_folder_and_erb_extension}"

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
