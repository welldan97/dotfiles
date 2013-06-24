require 'active_support/all'
require 'erb'
require 'yaml'
require 'pry'

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

class DotfilesProcessor
  class << self
    def exec
      files.each { |f| process_file f }
    end

    private

    def destination file
      "#{Dir.home}/#{Utils.normalize file}"
    end

    def dot_dirs
      Dir['dotfiles/*'].select { |f| File.directory? f }
    end

    module Utils
      class << self
        def normalize file
          remove_parents(remove_template_extension file)
        end

        def remove_parents file
          file.sub(/^dotfiles\/.*?\//, '')
        end

        def remove_template_extension file
          file.sub(/\.erb$/, '')
        end

        def tree dir
          Dir.glob("#{dir}/**/*", File::FNM_DOTMATCH).select { |f| File.file? f }
        end
      end
    end
  end
end

class DotfilesInstaller < DotfilesProcessor
  class << self
    private

    def files
      dot_dirs.map { |d| Utils.tree d }
        .flatten
    end

    def process_file file
      build_path destination(file)
      build_and_copy_file file
    end

    def build_path file
      FileUtils.mkdir_p File.dirname(file)
    end

    def build_and_copy_file file
      @config = OpenStruct.new YAML.load_file("#{Dir.home}/.config.yml")

      if File.extname(file) == '.erb'
        File.open(destination(file), 'w') do |f|
          f.write ERB.new(File.read(file)).result(binding)
        end
      else
        FileUtils.cp file, destination(file)
      end
    end
  end
end

class DotfilesUninstaller < DotfilesProcessor
  class << self
    private
    def files
      dot_dirs.map do |d|
        Dir.glob("#{d}/*", File::FNM_DOTMATCH).reject do |d|
          /^..?$/ =~ File.basename(d)
        end
      end.flatten
    end

    def process_file file
      FileUtils.rm_rf destination(file)
    end
  end
end
