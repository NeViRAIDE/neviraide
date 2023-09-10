dofile(vim.g.neviraide_themes_cache .. 'cmp')

local cmp = require('cmp')

return {
  completion = {
    completeopt = 'menu,menuone',
  },
  snippet = {
    expand = function(args) require('luasnip').lsp_expand(args.body) end,
  },
  window = {
    completion = {
      border = vim.g.borders,
      winhighlight = 'Normal:CmpPmenu,FloatBorder:CmpPmenu,Search:IncSearch,CursorLine:CmpSel',
    },
    documentation = { border = vim.g.borders },
  },
  select_behavior = cmp.SelectBehavior.Insert,
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-k>'] = cmp.mapping.scroll_docs(-4),
    ['<C-j>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif require('luasnip').expand_or_jumpable() then
        vim.fn.feedkeys(
          vim.api.nvim_replace_termcodes(
            '<Plug>luasnip-expand-or-jump',
            true,
            true,
            true
          ),
          ''
        )
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif require('luasnip').jumpable(-1) then
        vim.fn.feedkeys(
          vim.api.nvim_replace_termcodes(
            '<Plug>luasnip-jump-prev',
            true,
            true,
            true
          ),
          ''
        )
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    -- FIX: not expand lsp snippets
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'nvim_lua' },
    { name = 'async_path' },
  },
  sorting = {
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
      require('cmp-under-comparator').under,
    },
  },
  formatting = {
    fields = {
      cmp.ItemField.Kind,
      cmp.ItemField.Abbr,
      cmp.ItemField.Menu,
    },
    format = function(_, item)
      item.kind = string.format(
        '%s ',
        require('neviraide.utils').icons().lspkind[item.kind]
      )
      return item
    end,
  },
  experimental = {
    ghost_text = { hl_group = 'LspInlayHint' },
  },
}
