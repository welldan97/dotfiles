module ScriptsInstaller
  class << self
    def exec
      return if File.exists? "#{ENV['HOME']}/bin"
      FileUtils.ln_s File.expand_path('./scripts'), "#{ENV['HOME']}/bin"
    end
  end
end
