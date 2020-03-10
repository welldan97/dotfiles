PomodoremiCSV = require 'pomodoremi-csv'
PomodoremiToggl = require 'pomodoremi-toggl'

ONE_MIN_IN_MS = 60 * 1000
toMs =  (mins) -> mins * ONE_MIN_IN_MS

module.exports = ->
  @durations.work = toMs(30)
  @durations.shortBreak = toMs(2)
  @durations.longBreak = toMs(7)

  @modules.push new PomodoremiCSV()
  # @modules.push new PomodoremiToggl apiToken: '<%= toggl_api_token %>'