module PomodoremiInstaller
  class << self
    def exec
      return if File.exists? "#{ENV['HOME']}/.pomodoremi/node_modules"
#      `cd #{ENV['HOME']}/.pomodoremi/ && npm install`
    end
  end
end
