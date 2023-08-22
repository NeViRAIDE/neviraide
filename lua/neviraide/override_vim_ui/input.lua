local Input = require('nui.input')
local event = require('nui.utils.autocmd').event
local utils = require('neviraide.override_vim_ui.utils')

local border = require('neviraide.utils.settings.float_win')

local function override_ui_input()
  local UIInput = Input:extend('UIInput')

  function UIInput:init(opts, on_done)
    local border_top_text = utils.get_prompt_text(' ' .. opts.prompt, ' Input ')
    local default_value = tostring(opts.default)
    local text = { top = border_top_text, top_align = 'center' }

    UIInput.super.init(self, {
      relative = 'cursor',
      position = { row = 1, col = 0 },
      size = { width = math.max(20, vim.api.nvim_strwidth(default_value)) },
      border = border(text).border,
      win_options = utils.popup_bg(border),
      buf_options = { filetype = 'nui_input' },
    }, {
      default_value = default_value,
      on_close = function() on_done(nil) end,
      on_submit = function(value) on_done(value) end,
    })

    self:on(event.BufLeave, function() on_done(nil) end, { once = true })

    self:map(
      'n',
      { '<Esc>', 'q', '<C-c>' },
      function() on_done(nil) end,
      { noremap = true, nowait = true }
    )
  end

  local input_ui

  vim.ui.input = function(opts, on_confirm)
    assert(type(on_confirm) == 'function', 'missing on_confirm function')

    if input_ui then
      vim.api.nvim_err_writeln('busy: another input is pending!')
      return
    end

    input_ui = UIInput(opts, function(value)
      if input_ui then input_ui:unmount() end
      on_confirm(value)
      input_ui = nil
    end)

    input_ui:mount()
  end
end

override_ui_input()
