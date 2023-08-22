local ui = require('NEVIRAIDE')

return {
  name = 'NightFox',
  colors = {
    { bg = 'dark', name = 'NightFox', cmd = 'nightfox' },
    { bg = 'dark', name = 'DuskFox', cmd = 'duskfox' },
    { bg = 'dark', name = 'NordFox', cmd = 'nordfox' },
    { bg = 'dark', name = 'TeraFox', cmd = 'terafox' },
    { bg = 'light', name = 'DayFox', cmd = 'dayfox' },
    { bg = 'light', name = 'DawnFox', cmd = 'dawnfox' },
  },
  plugin = {
    'EdenEast/nightfox.nvim',
    version = '*',
    opts = {
      compile_path = vim.fn.stdpath('cache') .. '/nightfox',
      compile_file_suffix = '_compiled', -- Compiled file suffix
      transparent = ui.transparency, -- Disable setting background
      terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
      dim_inactive = false, -- Non focused panes set to alternative background
      module_default = true, -- Default enable value for modules
      styles = { -- Style to be applied to different syntax groups
        comments = 'italic', -- Value is any valid attr-list value `:help attr-list`
        conditionals = 'italic',
        constants = 'bold',
        functions = 'NONE',
        keywords = 'italic,bold',
        numbers = 'NONE',
        operators = 'NONE',
        strings = 'NONE',
        types = 'NONE',
        variables = 'NONE',
      },
      modules = {
        alpha = true,
        cmp = true,
        ['dap-ui'] = true,
        diagnostic = true,
        gitsigns = true,
        indent_blanklines = true,
        lightspeed = true,
        mini = true,
        modes = true,
        native_lsp = true,
        navic = true,
        neotree = true,
        notify = true,
        telescope = true,
        treesitter = true,
        tsrainbow2 = true,
        whichkey = true,
      },
    },
    config = function(_, opts)
      require('nightfox').setup({
        options = opts,
      })
    end,
  },
}
