dofile(vim.g.neviraide_themes_cache .. 'cmp')

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0
    and vim.api
        .nvim_buf_get_lines(0, line - 1, line, true)[1]
        :sub(col, col)
        :match('%s')
      == nil
end

local cmp = require('cmp')
local luasnip = require('luasnip')

return {
  completion = {
    completeopt = 'menu,menuone',
  },
  snippet = {
    expand = function(args) luasnip.lsp_expand(args.body) end,
  },
  window = {
    completion = {
      border = vim.g.borders,
      winhighlight = 'Normal:CmpPmenu,CursorLine:CmpSel,Search:None',
    },
    documentation = { border = vim.g.borders },
  },
  select_behavior = cmp.SelectBehavior.Insert,
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-k>'] = cmp.mapping.scroll_docs(-4),
    ['<C-j>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete({
      config = {
        sources = {
          { name = 'luasnip' },
        },
      },
    }),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }),
    --   ['<Tab>'] = cmp.mapping(function(fallback)
    --     if cmp.visible() then
    --       cmp.select_next_item()
    --     elseif require('luasnip').expand_or_jumpable() then
    --       vim.fn.feedkeys(
    --         vim.api.nvim_replace_termcodes(
    --           '<Plug>luasnip-expand-or-jump',
    --           true,
    --           true,
    --           true
    --         ),
    --         ''
    --       )
    --     else
    --       fallback()
    --     end
    --   end, { 'i', 's' }),
    --   ['<S-Tab>'] = cmp.mapping(function(fallback)
    --     if cmp.visible() then
    --       cmp.select_prev_item()
    --     elseif require('luasnip').jumpable(-1) then
    --       vim.fn.feedkeys(
    --         vim.api.nvim_replace_termcodes(
    --           '<Plug>luasnip-jump-prev',
    --           true,
    --           true,
    --           true
    --         ),
    --         ''
    --       )
    --     else
    --       fallback()
    --     end
    --   end, { 'i', 's' }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
      -- that way you will only jump inside the snippet region
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
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

  sources = {
    -- FIX: not expand lsp snippets and get error
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    {
      name = 'buffer',
      option = {
        get_bufnrs = function() return { vim.api.nvim_get_current_buf() } end,
      },
    },
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
    native_menu = false,
  },
}
