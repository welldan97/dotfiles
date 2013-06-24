require_relative 'util'

class DotfilesProcessor
  extend Util

  class << self
    def files
      dot_dirs.map { |d| tree d }
        .flatten
    end

    def exec
      files.each { |f| process_file f }
    end

    private

    def destination file
      "#{Dir.home}/#{normalize file}"
    end

    def dot_dirs
      Dir['dotfiles/*'].select { |f| File.directory? f }
    end
  end
end
