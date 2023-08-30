---------------l
---------------

local icon = require('neviraide-ui.icons.utils').icon

return {
  cmdline = {
    format = {
      cmdline = { icon = icon('vim') .. ' ' },
      search_down = {
        icon = '  ' .. icon('search') .. ' ' .. icon('chevron-down') .. ' ',
      },
      search_up = {
        icon = '  ' .. icon('search') .. ' ' .. icon('chevron-up') .. ' ',
      },
      fish = {
        pattern = '^:%s*!',
        icon = icon('terminal') .. ' ',
        lang = 'fish',
      },
      highlights = {
        pattern = '^:%s*hi?g?h?l?i?g?h?t?%s+',
        icon = icon('paintbrush') .. ' ',
      },
      lua = { icon = icon('lua') .. ' ' },
      filter = false,
    },
  },
  lsp = {
    override = {
      ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
      ['vim.lsp.util.stylize_markdown'] = true,
      ['cmp.entry.get_documentation'] = true,
    },
    signature = { enabled = false },
    hover = { enabled = false },
  },
  presets = {
    bottom_search = true,
    command_palette = true,
    long_message_to_split = true,
  },
  routes = {
    {
      view = 'vsplit',
      filter = { min_width = 1000 },
    },
  },
  views = {
    cmdline_popup = require('neviraide.utils').border(),
    split = {
      enter = true,
    },
  },
}
