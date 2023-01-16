local utils = require('utils.lualine_utils')

local indent = {
  function()
    local half_window_width = vim.api.nvim_win_get_width(0) / 2 - 14
    return string.rep(' ', half_window_width)
  end,
  padding = { left = 0, right = 0 },
}

local location = {
  'location',
  icon = '',
  cond = utils.conditions.buffer_not_empty,
  color = { bg = color.bg, gui = 'italic' },
  padding = { left = 1, right = 1 },
}

local vim_mode = {
  function()
    local mode_icons = {
      n = icon('vim-normal-mode'),
      i = icon('vim-insert-mode'),
      c = icon('vim-command-mode'),
      v = icon('vim-visual-mode'),
      [''] = icon('vim-visual-mode') .. '-Block',
      V = icon('vim-visual-mode') .. '-Line',
      R = icon('vim-replace-mode'),
      t = icon('vim-terminal-mode'),
    }
    return mode_icons[vim.fn.mode()]
  end,
  color = function()
    local mode_color = {
      n = color.green,
      i = color.blue,
      v = color.magenta,
      [''] = color.magenta,
      V = color.magenta,
      c = color.yellow,
      R = color.red,
      t = color.darkYellow,
    }
    return {
      fg = mode_color[vim.fn.mode()],
      gui = 'bold',
      bg = color.bg,
    }
  end,
  padding = { left = 1, right = 1 },
}

local progress = {
  'progress',
  cond = utils.conditions.buffer_not_empty,
  color = { fg = color.fg, gui = 'bold', bg = color.bg },
  padding = { left = 1, right = 1 },
}

return {
  indent,
  utils.separator('left'),
  location,
  utils.separator(),
  vim_mode,
  utils.separator(),
  progress,
  utils.separator('right'),
}
