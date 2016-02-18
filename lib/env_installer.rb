module EnvInstaller
  class << self
    def exec
      `zsh -c env > #{Dir.home}/.env`
    end
  end
end
