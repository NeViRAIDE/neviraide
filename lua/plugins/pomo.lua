return {
  'epwalsh/pomo.nvim',
  cmd = { 'TimerStart', 'TimerRepeat' },
  opts = function()
    local icon = require('stigmata.utils').icon

    local PrintNotifier = {}

    PrintNotifier.new = function(timer, opts)
      local self = setmetatable({}, { __index = PrintNotifier })
      self.timer = timer
      self.hidden = true
      self.opts = opts
      return self
    end

    PrintNotifier.start = function(self)
      vim.g.timer = true
      vim.cmd('redrawtabline')
      vim.notify(string.format('Starting timer for %ds', self.timer.time_limit))
    end

    PrintNotifier.tick = function(self, time_left)
      if not self.hidden then
        vim.notify(string.format('Timer %ds remaining...', time_left))
      end
    end

    PrintNotifier.done = function(self)
      vim.g.timer = false
      vim.cmd('redrawtabline')
      vim.notify('TIME IS UP!')
    end

    PrintNotifier.stop = function(self) end

    PrintNotifier.show = function(self) self.hidden = false end

    PrintNotifier.hide = function(self) self.hidden = true end

    return {
      update_interval = 1000,
      notifiers = {
        {
          init = PrintNotifier.new,
          opts = {
            title_icon = icon('󱎫', 'stopwatch', 0, 1),
          },
        },
      },
    }
  end,
}
