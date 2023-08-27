-- one
--two
-- idlskfjslkdjfl
local autocmd = require('nui.utils.autocmd')
local event = require('nui.utils.autocmd').event

local function reload_theme(name)
  vim.g.neviraide_theme = name
  require('neviraide-ui.themes').load_all_highlights()
  vim.api.nvim_exec_autocmds('User', { pattern = 'NeviraideThemeReload' })
end

return function()
  local write_to_conf = require('neviraide.utils').replace_word

  local popup = require('neviraide.utils.settings.change_theme.popup')()

  popup:on(
    require('nui.utils.autocmd').event.BufLeave,
    function() popup:unmount() end
  )
  popup:on('BufLeave', function() popup:unmount() end, { once = true })

  popup:mount()

  local tree = require('neviraide.utils.settings.change_theme.tree')(popup)

  local map_options = { noremap = true, nowait = true }

  -- local bufnr = vim.api.nvim_get_current_buf()
  -- autocmd.buf.define(bufnr, event.CursorMoved, function()
  --   require('neviraide.utils').autocmd('Preview_Theme', 'CursorHold', {
  --     buffer = bufnr,
  --     callback = function()
  --       if tree:get_node().name then reload_theme(tree:get_node().name) end
  --     end,
  --   })
  -- end, { once = true })

  popup:map('n', 'q', function() popup:unmount() end, map_options)

  popup:map('n', '<CR>', function()
    local node = tree:get_node()
    if node.name then
      write_to_conf(
        "theme = '" .. NEVIRAIDE().theme .. "'",
        "theme = '" .. node.name .. "'"
      )
      require('plenary.reload').reload_module('NEVIRAIDE')
      popup:unmount()
    elseif node:collapse() then
      tree:render()
    else
      node:expand()
      tree:render()
    end
  end, map_options)

  popup:map('n', '<LeftMouse>', function()
    local node = tree:get_node()
    if node.name then
      write_to_conf(
        "theme = '" .. NEVIRAIDE().theme .. "'",
        "theme = '" .. node.name .. "'"
      )
      require('plenary.reload').reload_module('NEVIRAIDE')
      popup:unmount()
    elseif node:collapse() then
      tree:render()
    else
      node:expand()
      tree:render()
    end
  end, map_options)

  -- collapse current node
  popup:map('n', 'h', function()
    local node = tree:get_node()
    if node:collapse() then tree:render() end
  end, map_options)

  -- expand current node
  popup:map('n', 'l', function()
    local node = tree:get_node()
    if node:expand() then tree:render() end
  end, map_options)

  tree:render()
end
