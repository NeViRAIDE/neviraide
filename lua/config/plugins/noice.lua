local M = {
  'folke/noice.nvim',
  dependencies = { 'MunifTanjim/nui.nvim', 'rcarriga/nvim-notify' },
  event = 'VeryLazy',
}

function M.config()
  require('noice').setup({
    cmdline = {
      format = {
        filter = { pattern = '^:%s*!', icon = '', lang = 'bash' },
      },
    },
    lsp = {
      override = {
        ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
        ['vim.lsp.util.stylize_markdown'] = true,
        ['cmp.entry.get_documentation'] = true,
        ['vim.lsp.buf.code_action'] = true,
      },
      signature = { enabled = false },
    },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = false,
      inc_rename = false,
      lsp_doc_border = true,
    },
  })

  require('settings.override_vim_ui')
end

return M
