local M = {
  'iamcco/markdown-preview.nvim',
  build = 'cd app && ./install.sh',
  event = 'BufReadPre',
  ft = { 'markdown' },
}

function M.config()
  vim.g.mkdp_filetypes = { 'markdown' }
  autocmd('NEVIRAIDE_Markdown', 'FileType', {
    pattern = 'markdown',
    desc = 'Add markdown features',
    callback = function()
      require('config.plugins.which-key.keybindings.markdown_keys').attach_markdown(
        0
      )
    end,
  })
end

return M
