dofile(vim.g.neviraide_themes_cache .. 'notify')

local icon = require('neviraide-ui.icons.utils').icon

return {
  on_open = function(win, record)
    if vim.api.nvim_win_is_valid(win) then
      vim.api.nvim_win_set_config(win, {
        title = {
          {
            ' ' .. record.icon .. ' ' .. record.title[1] .. ' ',
            'Notify' .. record.level .. 'Title',
          },
        },
        title_pos = 'center',
        border = require('neviraide.utils').border(),
      })
    end
  end,
  render = function(bufnr, notif, highlights)
    local renderbase = require('notify.render.base')
    local namespace = renderbase.namespace()
    local length = string.len(notif.icon)

    notif.message[1] = string.format(' %s ', notif.message[1])
    vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, notif.message)

    vim.api.nvim_buf_set_extmark(bufnr, namespace, 0, length, {
      hl_group = highlights.body,
      end_line = #notif.message,
      priority = 50,
    })
  end,
  timeout = 3000,
  fps = 60,
  icons = {
    ERROR = icon('x-circle') .. ' ',
    WARN = icon('alert') .. ' ',
    INFO = icon('info') .. ' ',
    DEBUG = icon('bug') .. ' ',
    TRACE = icon('play') .. ' ',
  },
  minimum_width = 10,
  max_height = function() return math.floor(vim.o.lines * 0.75) end,
  max_width = function() return math.floor(vim.o.columns * 0.75) end,
}
