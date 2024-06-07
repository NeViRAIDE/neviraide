return {
  'hrsh7th/nvim-cmp',
  version = false,
  event = 'InsertEnter',
  dependencies = {
    require('plugins.luasnippets'),
    require('plugins.autopairs'),
    { 'saadparwaiz1/cmp_luasnip' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'lukas-reineke/cmp-under-comparator' },
    { 'FelipeLema/cmp-async-path' },
  },
  opts = function()
    dofile(vim.g.ntc .. 'cmp')

    local cmp = require('cmp')
    local luasnip = require('luasnip')

    return {
      snippet = {
        expand = function(args) luasnip.lsp_expand(args.body) end,
      },
      window = {
        completion = {
          border = vim.g.b,
          winhighlight = 'Normal:CmpPmenu,CursorLine:CmpSel,Search:None',
        },
        documentation = {
          border = vim.g.b,
          winhighlight = 'Normal:CmpPmenu,CursorLine:CmpSel,Search:None',
        },
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
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      }),

      sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        {
          name = 'lazydev',
          group_index = 0,
        },
        {
          name = 'buffer',
          option = {
            get_bufnrs = function() return { vim.api.nvim_get_current_buf() } end,
          },
        },
        { name = 'nvim_lua' },
        { name = 'async_path' },
        { name = 'crates' },
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
  end,
}
