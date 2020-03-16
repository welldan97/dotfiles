PomodoremiCSV = require 'pomodoremi-csv'
PomodoremiToggl = require 'pomodoremi-toggl'
fs = require 'fs';

ONE_MIN_IN_MS = 60 * 1000
toMs =  (mins) -> mins * ONE_MIN_IN_MS

apiToken = fs.readFileSync(process.env.HOME + '/.pomodoremi/toggl_api_token', 'utf8');

module.exports = ->
  @durations.work = toMs(30)
  @durations.shortBreak = toMs(2)
  @durations.longBreak = toMs(7)

  @modules.push new PomodoremiCSV()
  @modules.push new PomodoremiToggl apiToken: apiToken
