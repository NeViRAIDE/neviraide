require('config.telescope')
require('config.tree-sitter')
require('config.dap')
require('config.notify')
require('config.colorscheme')
require('config.lualine')
require('config.dashboard')
require('config.nvim-tree')

require('config.which_key').setup()

require('focus').setup({ width = 90 })

require('colorizer').setup({
  filetypes = { '*' },
  user_default_options = {
    RGB = true, -- #RGB hex codes
    RRGGBB = true, -- #RRGGBB hex codes
    names = false, -- "Name" codes like Blue or blue
    RRGGBBAA = true, -- #RRGGBBAA hex codes
    AARRGGBB = true, -- 0xAARRGGBB hex codes
    rgb_fn = true, -- CSS rgb() and rgba() functions
    hsl_fn = true, -- CSS hsl() and hsla() functions
    css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
    css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
    -- Available modes for `mode`: foreground, background,  virtualtext
    mode = 'background', -- Set the display mode.
    -- Available methods are false / "normal" / "lsp" / "both"
    tailwind = 'both', -- Enable tailwind colors
    virtualtext = '■',
  },
  -- all the sub-options of filetypes apply to buftypes
  buftypes = {},
})

require('impatient').enable_profile()

require('link-visitor').setup({
  silent = true,
})

require('indent_blankline').setup({
  filetype_exclude = { 'dashboard', 'packer', 'help' },
  use_treesitter = true,
  show_current_context = true,
  show_current_context_start = true,
  show_first_indent_level = false,
})
