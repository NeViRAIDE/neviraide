local wk_register =
  require('config.plugins.which-key.keybindings.main').wk_register

local function attach_markdown(bufnr)
  wk_register({
    ['<leader>'] = {
      name = 'Plugins and features ' .. icon('rocket', '', ''),
      P = {
        '<cmd>MarkdownPreviewToggle<cr>',
        'Toggle preview markdown ' .. icon('markdown', '', ''),
      },
    },
  }, { buffer = bufnr, mode = 'n' })
end

return { attach_markdown = attach_markdown }
