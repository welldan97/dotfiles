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
