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
      if File.extname(file) == '.erb'
        File.open(destination(file), 'w') do |f|
          f.write ERB.new(File.read(file)).result($config.instance_eval { binding })
        end
      elsif file =~ /\.js\.coffee/
        `coffee -bc --no-header -o "#{File.dirname destination(file)}" "#{file}"`
        FileUtils.mv "#{destination(file)}.js", destination(file)
      else
        FileUtils.cp file, destination(file)
      end
    end
  end
end
