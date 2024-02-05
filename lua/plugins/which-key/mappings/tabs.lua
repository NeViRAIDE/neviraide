local i = require('neviraide.ui.neviraide-ui.icons.utils').icon

return {
  name = 'Tabs' .. i('t', 'tab-external', 1),
  c = {
    name = 'Close' .. i('', 'trash', 1),
    c = {
      '<cmd>tabclose<cr>',
      'Close current',
    },
    a = {
      '<cmd>tabonly<cr>',
      'Close all, except the current one',
    },
  },
  p = {
    '<cmd>tabprevious<cr>',
    'Go to previous',
  },
  n = {
    '<cmd>tabnext<cr>',
    'Go to next',
  },
  N = {
    '<cmd>tabnew<cr>',
    'New',
  },
  m = {
    name = 'Move',
    r = {
      '<cmd>+tabmove<cr>',
      'Move to the right',
    },
    l = {
      '<cmd>-tabmove<cr>',
      'Move to the left',
    },
  },
  r = {
    function()
      local number_of_tabs = vim.fn.tabpagenr('$')
      if number_of_tabs > 1 then
        require('neviraide.ui.neviraide-ui.utils.set_tab_name')()
      end
    end,
    'Rename',
  },
  t = {
    function()
      require('neviraide.ui.neviraide-ui.buftabline.modules.components').toggle_tabs()
    end,
    'Toggle tabs panel',
  },
}
