module ScriptsInstaller
  class << self
    def exec
      FileUtils.ln_s File.expand_path('./scripts'), "#{ENV['HOME']}/bin"
    end
  end
end
