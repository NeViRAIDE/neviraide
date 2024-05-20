return function()
  local icon = require('stigmata.utils').icon

  return {
    keywords = {
      FIX = { icon = icon('', 'bug', 0, 1) },
      TODO = { icon = icon('', 'check', 0, 1) },
      HACK = { icon = icon('', 'flame', 0, 1) },
      WARN = { icon = icon('', 'alert', 0, 1) },
      PERF = { icon = icon('', 'stopwatch', 0, 1) },
      NOTE = { icon = icon('', 'note', 0, 1) },
      TEST = { icon = icon('⏲', 'hourglass', 0, 1) },
    },
  }
end
