module ScriptsInstaller
  class << self
    def exec
      FileUtils.ln_s './scripts', "#{ENV['HOME']}/bin"
    end
  end
end
