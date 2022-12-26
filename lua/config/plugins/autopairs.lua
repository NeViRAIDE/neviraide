local M = { "windwp/nvim-autopairs", event = "InsertEnter" }

function M.config()
  local cmp = require('cmp')
  local cmp_autopairs = require('nvim-autopairs.completion.cmp')
  local handlers = require('nvim-autopairs.completion.handlers')

  require('nvim-autopairs').setup({
    enable_check_bracket_line = false,
    fast_wrap = {
      map = '<C-b>',
      chars = { '{', '[', '(', '"', "'" },
      pattern = [=[[%'%"%)%>%]%)%}%,]]=],
      end_key = '$',
      keys = 'qwertyuiopzxcvbnmasdfghjkl',
      check_comma = true,
      highlight = 'Search',
      highlight_grey = 'Comment',
    },
  })

  cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done({
      filetypes = {
        ['*'] = {
          ['('] = {
            kind = {
              cmp.lsp.CompletionItemKind.Function,
              cmp.lsp.CompletionItemKind.Method,
            },
            handler = handlers['*'],
          },
        },
        tex = false,
      },
    })
  )
end

return M
