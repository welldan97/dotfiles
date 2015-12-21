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
      #throw 'missing env vars' if env_vars_empty?
      @config = $config

      if File.extname(file) == '.erb'
        File.open(destination(file), 'w') do |f|
          f.write ERB.new(File.read(file)).result(binding)
        end
      else
        FileUtils.cp file, destination(file)
      end
    end

    # def env_vars_empty?
      # ENV['DOTFILES_REAL_NAME'].empty? ||
      # ENV['DOTFILES_EMAIL'].empty?
    # end
  end
end
