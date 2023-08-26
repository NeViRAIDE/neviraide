return {
  {
    'hrsh7th/nvim-cmp',
    version = '*',
    event = 'InsertEnter',
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        version = '*',
        dependencies = {
          'rafamadriz/friendly-snippets',
          config = function()
            require('luasnip.loaders.from_vscode').lazy_load()
          end,
        },
        opts = { history = true, updateevents = 'TextChanged,TextChangedI' },
      },
      {
        'windwp/nvim-autopairs',
        version = '*',
        opts = {
          fast_wrap = {},
          disable_filetype = { 'TelescopePrompt', 'vim' },
        },
        config = function(_, opts)
          require('nvim-autopairs').setup(opts)
          local cmp_autopairs = require('nvim-autopairs.completion.cmp')
          require('cmp').event:on(
            'confirm_done',
            cmp_autopairs.on_confirm_done()
          )
        end,
      },
      {
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'lukas-reineke/cmp-under-comparator',
      },
    },
    opts = function()
      local border = require('neviraide.utils').border()
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
            border = border,
            winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,Search:None',
          },
          documentation = { border = border },
        },
        mapping = {
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
          end, {
            'i',
            's',
          }),
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
          end, {
            'i',
            's',
          }),
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'buffer' },
          { name = 'nvim_lua' },
          { name = 'path' },
        },
        sorting = {
          comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            require('cmp-under-comparator').under,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
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
              require('neviraide-ui.icons.lspkind')[item.kind]
            )
            return item
          end,
        },
        experimental = {
          ghost_text = {
            hl_group = 'Comment',
          },
        },
      }
    end,
    config = function(_, opts)
      dofile(vim.g.neviraide_themes_cache .. 'cmp')
      require('cmp').setup(opts)
    end,
  },
}
