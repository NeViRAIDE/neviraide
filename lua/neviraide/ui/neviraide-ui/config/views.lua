local require = require('neviraide.ui.neviraide-ui.utils.lazy')

local Util = require('neviraide.ui.neviraide-ui.utils')
local Config = require('neviraide.ui.neviraide-ui.config')

local border = NEVIRAIDE().border

local M = {}

---@param view string
---@return NeviraideUIViewOptions
function M.get_options(view)
  if not view then Util.panic('View is missing?') end

  local opts = { view = view }

  local done = {}
  while opts.view and not done[opts.view] do
    done[opts.view] = true

    local view_opts = vim.deepcopy(Config.options.views[opts.view] or {})
    opts = vim.tbl_deep_extend('keep', opts, view_opts)
    opts.view = view_opts.view
  end

  return opts
end

---@class NeviraideUIConfigViews: table<string, NeviraideUIViewOptions>
M.defaults = {
  popupmenu = {
    relative = 'editor',
    zindex = 65,
    position = 'auto', -- when auto, then it will be positioned to the cmdline or cursor
    size = {
      width = 'auto',
      height = 'auto',
      max_height = 20,
      -- min_width = 10,
    },
    win_options = {
      winbar = '',
      foldenable = false,
      cursorline = true,
      cursorlineopt = 'line',
      winhighlight = {
        Normal = 'NeviraideUIPopupmenu', -- change to NormalFloat to make it look like other floats
        FloatBorder = 'NeviraideUIPopupmenuBorder', -- border highlight
        CursorLine = 'NeviraideUIPopupmenuSelected', -- used for highlighting the selected item
        PmenuMatch = 'NeviraideUIPopupmenuMatch', -- used to highlight the part of the item that matches the input
      },
    },
    border = {
      style = border,
      padding = { 0, 1 },
    },
  },

  cmdline = {
    backend = 'popup',
    relative = 'editor',
    position = {
      row = '100%',
      col = 0,
    },
    size = {
      height = 'auto',
      width = '100%',
    },
    border = {
      style = border,
    },
    win_options = {
      winhighlight = {
        Normal = 'NeviraideUICmdline',
        IncSearch = '',
        CurSearch = '',
        Search = '',
      },
    },
  },
  cmdline_popup = {
    backend = 'popup',
    relative = 'editor',
    focusable = false,
    enter = false,
    zindex = 200,
    position = {
      row = 2,
      col = '50%',
    },
    size = {
      min_width = 60,
      width = 'auto',
      height = 'auto',
    },
    border = {
      style = border,
      padding = { 0, 1 },
    },
    win_options = {
      winhighlight = {
        Normal = 'NeviraideUICmdlinePopup',
        FloatTitle = 'NeviraideUICmdlinePopupTitle',
        FloatBorder = 'NeviraideUICmdlinePopupBorder',
        IncSearch = '',
        CurSearch = '',
        Search = '',
      },
      winbar = '',
      foldenable = false,
      cursorline = false,
    },
  },
  cmdline_popupmenu = {
    view = 'popupmenu',
    zindex = 200,
    relative = 'editor',
    position = {
      row = 5,
      col = '50%',
    },
    size = {
      width = 60,
      height = 'auto',
      max_height = 15,
    },
    border = {
      style = border,
      padding = { 0, 1 },
    },
    win_options = {
      winhighlight = {
        Normal = 'Normal',
        FloatBorder = 'NeviraideUICmdlinePopupBorder',
      },
    },
  },
  virtualtext = {
    backend = 'virtualtext',
    format = { '{message}' },
    hl_group = 'NeviraideUIVirtualText',
  },
  notify = {
    backend = 'notify',
    format = 'notify',
    replace = false,
    merge = false,
  },
  split = {
    backend = 'split',
    enter = true,
    relative = 'editor',
    position = 'bottom',
    size = '30%',
    close = {
      keys = { 'q' },
    },
    win_options = {
      winhighlight = {
        Normal = 'NeviraideUISplit',
        FloatBorder = 'NeviraideUISplitBorder',
      },
      wrap = true,
    },
  },
  cmdline_output = {
    format = 'details',
    view = 'split',
  },
  messages = {
    view = 'split',
    enter = true,
  },
  vsplit = {
    view = 'split',
    position = 'right',
  },
  popup = {
    backend = 'popup',
    relative = 'editor',
    close = {
      events = { 'BufLeave' },
      keys = { 'q' },
    },
    enter = true,
    border = {
      style = border,
    },
    position = '50%',
    size = {
      width = '120',
      height = '20',
    },
    win_options = {
      winhighlight = {
        Normal = 'NeviraideUIPopup',
        FloatBorder = 'NeviraideUIPopupBorder',
      },
      winbar = '',
      foldenable = false,
    },
  },
  hover = {
    view = 'popup',
    relative = 'cursor',
    zindex = 45,
    enter = false,
    anchor = 'auto',
    size = {
      width = 'auto',
      height = 'auto',
      max_height = 20,
      max_width = 120,
    },
    border = {
      style = border,
      padding = { 0, 2 },
    },
    position = { row = 1, col = 0 },
    win_options = {
      wrap = true,
      linebreak = true,
    },
  },
  confirm = {
    backend = 'popup',
    relative = 'editor',
    focusable = false,
    align = 'center',
    enter = false,
    zindex = 210,
    format = { '{confirm}' },
    position = {
      row = '50%',
      col = '50%',
    },
    size = 'auto',
    border = {
      style = border,
      padding = { 0, 1 },
      text = {
        top = ' Confirm ',
      },
    },
    win_options = {
      winhighlight = {
        Normal = 'NeviraideUIConfirm',
        FloatBorder = 'NeviraideUIConfirmBorder',
      },
      winbar = '',
      foldenable = false,
    },
  },
}

return M
