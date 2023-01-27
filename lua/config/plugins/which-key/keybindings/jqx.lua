local wk_register =
  require('config.plugins.which-key.keybindings.main').wk_register

local function attach_jqx(bufnr)
  wk_register({
    ['<leader>'] = {
      name = 'Plugins and features ' .. icon('rocket'),
      J = {
        name = 'JQX ' .. icon('json'),
        l = { ':JqxList<cr>', 'List' },
        q = { ':JqxQuery<cr>', 'Query' },
      },
    },
  }, { buffer = bufnr, mode = 'n' })
end

return { attach_jqx = attach_jqx }
