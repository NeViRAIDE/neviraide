require('lspsaga').init_lsp_saga({
  border_style = 'rounded',
  saga_winblend = 20,
  diagnostic_header = {
    icon('x-circle'),
    icon('alert'),
    icon('info'),
    icon('light-bulb'),
  },
  code_action_lightbulb = {
    enable = false,
    sign = false,
    enable_in_insert = false,
    sign_priority = 20,
    virtual_text = false,
  },
  finder_icons = {
    def = '  ',
    ref = icon('cross-reference') .. ' ',
    link = icon('link') .. ' ',
  },
  finder_request_timeout = 1500,
  finder_action_keys = {
    open = 'o',
    vsplit = 'v',
    split = 's',
    tabe = 't',
    quit = 'q',
    scroll_down = '<C-j>',
    scroll_up = '<C-k>',
  },
  symbol_in_winbar = {
    in_custom = true,
    separator = ' ' .. icon('triangle-right'),
  },
})
