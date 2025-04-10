return {
  'L3MON4D3/LuaSnip',
  build = 'make install_jsregexp',
  event = 'InsertEnter',
  dependencies = {
    'rafamadriz/friendly-snippets',
  },
  opts = {
    history = true,
    updateevents = 'TextChanged,TextChangedI',
  },
  config = function(_, opts)
    local luasnip = require('luasnip')

    luasnip.config.set_config(opts)

    -- Load snippets from various formats
    require('luasnip.loaders.from_vscode').lazy_load()
    require('luasnip.loaders.from_vscode').lazy_load({
      paths = vim.g.vscode_snippets_path or '',
    })

    require('luasnip.loaders.from_snipmate').load()
    require('luasnip.loaders.from_snipmate').lazy_load({
      paths = vim.g.snipmate_snippets_path or '',
    })

    require('luasnip.loaders.from_lua').load()
    require('luasnip.loaders.from_lua').lazy_load({
      paths = vim.g.lua_snippets_path or '',
    })

    -- Auto-unlink snippet if not jumping
    vim.api.nvim_create_autocmd('InsertLeave', {
      callback = function()
        local current_buf = vim.api.nvim_get_current_buf()
        if
          luasnip.session.current_nodes[current_buf]
          and not luasnip.session.jump_active
        then
          luasnip.unlink_current()
        end
      end,
    })
  end,
}
