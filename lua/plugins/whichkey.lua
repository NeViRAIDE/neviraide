return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = function()
    local mappings = require('plugins.which-key.mappings')
    local i = require('stigmata.utils').icon

    mappings()
    dofile(vim.g.ntc .. 'whichkey')

    return {
      ---@type false | "classic" | "modern" | "helix"
      preset = 'modern',
      win = {
        border = vim.g.b,
        wo = {
          winblend = vim.g.blend,
        },
      },
      keys = { scroll_down = '<c-j>', scroll_up = '<c-k>' },
      icons = {
        breadcrumb = i('»', 'chevron-right', 1),
        separator = i('➜', 'arrow-right', 0, 1),
        group = i('+', 'plus', 0, 1),
      },
    }
  end,
}
