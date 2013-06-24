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
  puts "copying dotfiles"
  DotfilesProcessor.copy_dotfiles
end

desc "sets crotab from ~/.crontab"
task :set_crontab do
  puts "setting crontab"
  system "crontab -r"
  system "crontab ~/.crontab"
end

module DotfilesProcessor
  @config = OpenStruct.new YAML.load_file("#{Dir.home}/.config.yml")

  class << self
    def copy_dotfiles
      files_tree.each { |f| process_file f }
    end

    def remove_dotfiles
      files_to_remove_tree.each { |f| remove_file f }
    end

    private

    def files_to_remove_tree
      dot_dirs.map do |d|
        Dir.glob("#{d}/*", File::FNM_DOTMATCH).reject do |d|
          /^..?$/ =~ File.basename(d)
        end
      end.flatten
    end

    def files_tree
      dot_dirs.map { |d| Utils.tree d }
        .flatten
    end

    def remove_file file
      FileUtils.rm_rf destination(file)
    end

    def process_file file
      build_path destination(file)
      build_and_copy_file file
    end

    def destination file
      "#{Dir.home}/#{Utils.normalize file}"
    end

    def build_path file
      FileUtils.mkdir_p File.dirname(file)
    end

    def dot_dirs
      Dir['*'].select { |f| File.directory? f }
    end

    def build_and_copy_file file
      if File.extname(file) == '.erb'
        File.open(destination(file), 'w') do |f|
          f.write ERB.new(File.read(file)).result(binding)
        end
      else
        FileUtils.cp file, destination(file)
      end
    end

    module Utils
      class << self
        def normalize file
          remove_parent(remove_template_extension file)
        end

        def remove_parent file
          file.sub(/^.*?\//, '')
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
