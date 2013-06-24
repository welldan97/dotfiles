require_relative 'util'

class DotfilesProcessor
  extend Util

  class << self
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
