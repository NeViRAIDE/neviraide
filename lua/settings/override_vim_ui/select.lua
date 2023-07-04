local Menu = require('nui.menu')
local event = require('nui.utils.autocmd').event
local get_prompt_text = require('settings.override_vim_ui.get_prompt')

local function override_ui_select()
  local UISelect = Menu:extend('UISelect')

  function UISelect:init(items, opts, on_done)
    local border_top_text = get_prompt_text(opts.prompt, ' Select Item ')
    local kind = opts.kind or 'unknown'
    local format_item = opts.format_item
        or function(item) return tostring(item.__raw_item or item) end

    local popup_options = {
      relative = 'editor',
      position = '50%',
      border = {
        style = 'rounded',
        text = {
          top = border_top_text,
          top_align = 'center',
        },
        padding = { 0, 1 },
      },
      win_options = {
        winhighlight = 'Normal:String,FloatBorder:DevIconCsv',
      },
      buf_options = {
        filetype = 'nui',
      },
      zindex = 999,
    }

    if kind == 'codeaction' then
      popup_options.relative = 'cursor'
      popup_options.position = { row = 1, col = 1 }
    end

    local max_width = popup_options.relative == 'editor' and vim.o.columns - 4
        or vim.api.nvim_win_get_width(0) - 4
    local max_height = popup_options.relative == 'editor'
        and math.floor(vim.o.lines * 80 / 100)
        or vim.api.nvim_win_get_height(0)

    local menu_items = {}
    for index, item in ipairs(items) do
      if type(item) ~= 'table' then item = { __raw_item = item } end
      item.index = index
      local item_text = string.sub(format_item(item), 0, max_width)
      menu_items[index] = Menu.item(item_text, item)
    end

    local menu_options = {
      min_width = vim.api.nvim_strwidth(border_top_text),
      max_width = max_width,
      max_height = max_height,
      lines = menu_items,
      on_close = function() on_done(nil, nil) end,
      on_submit = function(item) on_done(item.__raw_item or item, item.index) end,
    }

    UISelect.super.init(self, popup_options, menu_options)

    self:on(event.BufLeave, function() on_done(nil, nil) end, { once = true })
  end

  local select_ui = nil

  vim.ui.select = function(items, opts, on_choice)
    assert(type(on_choice) == 'function', 'missing on_choice function')

    if select_ui then
      vim.api.nvim_err_writeln('busy: another select is pending!')
      return
    end

    select_ui = UISelect(items, opts, function(item, index)
      if select_ui then select_ui:unmount() end
      on_choice(item, index)
      select_ui = nil
    end)

    select_ui:mount()
  end
end

override_ui_select()
