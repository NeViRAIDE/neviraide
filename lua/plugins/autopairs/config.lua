return function(_, opts)
  require('nvim-autopairs').setup(opts)
  local cmp_autopairs = require('nvim-autopairs.completion.cmp')
  require('cmp').event:on('confirm_done', cmp_autopairs.on_confirm_done())
end
