module EnvInstaller
  class << self
    def exec

      env = ENV.keys.map do |k|
        "export #{k}=\"#{ENV[k].gsub('"','\"')}\""
      end.join("\n")
      File.write("#{Dir.home}/.env", env)
    end
  end
end
