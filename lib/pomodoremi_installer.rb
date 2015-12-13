module PomodoremiInstaller
  class << self
    def exec
      `cd #{ENV['HOME']}/.pomodoremi/ && npm install`
    end
  end
end
