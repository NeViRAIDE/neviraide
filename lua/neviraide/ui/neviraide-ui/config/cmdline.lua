local require = require('neviraide.ui.neviraide-ui.utils.lazy')

local Config = require('neviraide.ui.neviraide-ui.config')
local Highlights = require('neviraide.ui.neviraide-ui.config.highlights')
local i = require('neviraide.ui.neviraide-ui.icons.utils').icon

local M = {}

M.formats = {
  cmdline = {
    pattern = '^:',
    icon = i('', 'vim', 0, 1),
    lang = 'vim',
  },
  search_down = {
    kind = 'search',
    pattern = '^/',
    icon = i('', 'search') .. i('󰄼', 'chevron-down', 1, 1),
    lang = 'regex',
  },
  search_up = {
    kind = 'search',
    pattern = '^%?',
    icon = i('', 'search') .. i('󰄿', 'chevron-up', 1, 1),
    lang = 'regex',
  },
  terminal = {
    pattern = '^:%s*!',
    icon = i('$', 'bash', 0, 1),
    lang = 'bash',
  },
  highlight = {
    pattern = { '^:%s*highlight%s+', '^:%s*hi%s+' },
    icon = i('', 'paintbrush', 0, 1),
    lang = 'vim',
  },
  lua = {
    pattern = { '^:%s*lua%s+' },
    icon = i('', 'lua', 0, 1),
    lang = 'lua',
  },
  help = {
    pattern = '^:%s*he?l?p?%s+',
    icon = i('󰋖', 'question', 0, 1),
  },
  calculator = {
    pattern = '^:%s*=%s+',
    icon = i('󱖦', 'number', 0, 1),
    lang = 'vimnormal',
  },
  input = {},
}

function M.setup()
  for name, format in pairs(M.formats) do
    if format == false then
      M.formats[name] = nil
    else
      local kind = format.kind or name
      local kind_cc = kind:sub(1, 1):upper() .. kind:sub(2)

      local hl_group_icon = 'CmdlineIcon' .. kind_cc
      Highlights.add(hl_group_icon, 'NeviraideUICmdlineIcon')

      local hl_group_border = 'CmdlinePopupBorder' .. kind_cc
      Highlights.add(hl_group_border, 'NeviraideUICmdlinePopupBorder')

      format = vim.tbl_deep_extend('force', {
        conceal = format.conceal ~= false,
        kind = kind,
        icon_hl_group = 'NeviraideUI' .. hl_group_icon,
        view = 'cmdline_popup',
        lang = format.lang or format.ft,
        opts = {
          ---@diagnostic disable-next-line: undefined-field
          border = {
            text = {
              top = format.title or (' ' .. kind_cc .. ' '),
            },
          },
          win_options = {
            winhighlight = {
              FloatBorder = 'NeviraideUI' .. hl_group_border,
            },
          },
        },
      }, { opts = vim.deepcopy({}) }, format)
      M.formats[name] = format

      table.insert(Config.options.routes, {
        view = format.view,
        opts = format.opts,
        filter = { event = 'cmdline', kind = format.kind },
      })
    end
  end
end

return M
