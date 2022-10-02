local lspkind = require('lspkind')
local luasnip = require('luasnip')
local neogen = require('neogen')
local cmp = require('cmp')
local types = require('cmp.types')
local str = require('cmp.utils.str')

luasnip.config.setup({
  region_check_events = 'CursorMoved',
  delete_check_events = 'TextChanged',
})

-- TODO: make an issue for disable popup window completion for empty line or space
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
      elseif neogen.jumpable() then
        neogen.jump_next()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif neogen.jumpable(true) then
        neogen.jump_prev()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = cmp.config.sources({
    { name = 'dap' },
    { name = 'latex_symbols' },
    { name = 'nvim_lua' },
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'calc' },
    { name = 'path' },
    { name = 'cmdline' },
  }, {
    { name = 'buffer' },
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
})

for _, v in pairs({ '/', '?' }) do
  cmp.setup.cmdline(v, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = { { name = 'buffer' } },
  })
end
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' },
  }, {
    { name = 'cmdline' },
  }),
})
