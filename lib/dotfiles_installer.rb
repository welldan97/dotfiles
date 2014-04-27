class DotfilesInstaller < DotfilesProcessor
  class << self
    private

    def process_file(file)
      build_path destination(file)
      build_and_copy_file file
    end

    def build_path(file)
      FileUtils.mkdir_p File.dirname(file)
    end

    def build_and_copy_file(file)
      @config = ProjectConfig

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
