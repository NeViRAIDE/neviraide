local M = {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-calc',
    'hrsh7th/cmp-path',
    'kdheepak/cmp-latex-symbols',
    'saadparwaiz1/cmp_luasnip',

    'L3MON4D3/LuaSnip',
    'rafamadriz/friendly-snippets',

    {
      'onsails/lspkind-nvim',
      config = function() require('lspkind').init({ preset = 'codicons' }) end,
    },
  },
}

function M.config()
  local lspkind = require('lspkind')
  local luasnip = require('luasnip')
  local cmp = require('cmp')
  local types = require('cmp.types')
  local str = require('cmp.utils.str')

  cmp.setup({
    snippet = {
      expand = function(args) luasnip.lsp_expand(args.body) end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    preselect = cmp.PreselectMode.None,
    completion = { completeopt = 'menu,menuone,noselect' },
    mapping = cmp.mapping.preset.insert({
      ['<C-k>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-j>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-CR>'] = cmp.mapping.complete(),
      ['<C-q>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      }),
      ['<Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { 'i', 's' }),
      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { 'i', 's' }),
    }),
    sources = cmp.config.sources({
      { name = 'dap' },
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
      { name = 'nvim_lua' },
      { name = 'path' },
      { name = 'neorg' },
    }, {
      { name = 'buffer' },
      { name = 'calc' },
      { name = 'latex_symbols' },
    }),
    formatting = {
      fields = {
        cmp.ItemField.Kind,
        cmp.ItemField.Abbr,
        cmp.ItemField.Menu,
      },
      format = lspkind.cmp_format({
        with_text = false,
        before = function(entry, vim_item)
          local word = entry:get_insert_text()
          if
            entry.completion_item.insertTextFormat
            == types.lsp.InsertTextFormat.Snippet
          then
            word = vim.lsp.util.parse_snippet(word)
          end
          word = str.oneline(word)

          local max = 50
          if string.len(word) >= max then
            local before = string.sub(word, 1, math.floor((max - 3) / 2))
            word = before .. '...'
          end

          if
            entry.completion_item.insertTextFormat
              == types.lsp.InsertTextFormat.Snippet
            and string.sub(vim_item.abbr, -1, -1) == '~'
          then
            word = word .. '~'
          end
          vim_item.abbr = word

          return vim_item
        end,
      }),
    },
    experimental = {
      ghost_text = {
        hl_group = 'Comment',
      },
    },
  })
end

return M
