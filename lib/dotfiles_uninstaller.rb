class DotfilesUninstaller < DotfilesProcessor
  class << self
    private

    def process_file file
      FileUtils.rm destination(file) if File.exist? destination(file)
      remove_empty_parent_dir destination(file)
    end

    def remove_empty_parent_dir file
      dir = File.dirname(file)
      FileUtils.rmdir dir if removable? dir
    end

    def removable? dir
      File.exist?(dir) && (Dir.entries(dir) - %w{ . .. }).empty?
    end
  end
end
