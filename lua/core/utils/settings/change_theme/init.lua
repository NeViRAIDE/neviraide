return function()
  ---@type integer number of themes installed
  local write_to_conf = require('core.utils').replace_word
  local change_pallete = function(pallete) vim.g.everforest_background = pallete end
  local ui = require('NEVIRAIDE').ui

  local popup = require('core.utils.settings.change_theme.popup')()

  popup:on(
    require('nui.utils.autocmd').event.BufLeave,
    function() popup:unmount() end
  )
  popup:mount()

  local tree = require('core.utils.settings.change_theme.tree')(popup)

  local map_options = { noremap = true, nowait = true }

  popup:map('n', 'q', function() popup:unmount() end, map_options)

  popup:map('n', '<CR>', function()
    local node = tree:get_node()
    if node.theme then
      if node.background then
        if node.pallete then
          write_to_conf(
            "pallete = '" .. ui.pallete .. "'",
            "pallete = '" .. node.pallete .. "'"
          )
          change_pallete(node.pallete)
        end
        write_to_conf(
          "background = '" .. ui.background .. "'",
          "background = '" .. node.background .. "'"
        )
        vim.o.background = node.background
      end
      write_to_conf(
        "theme = '" .. ui.theme .. "'",
        "theme = '" .. node.theme .. "'"
      )
      vim.cmd.colorscheme(node.theme)
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
    if node.theme then
      if node.background then
        if node.pallete then
          write_to_conf(
            "pallete = '" .. ui.pallete .. "'",
            "pallete = '" .. node.pallete .. "'"
          )
          change_pallete(node.pallete)
        end
        write_to_conf(
          "background = '" .. ui.background .. "'",
          "background = '" .. node.background .. "'"
        )
        vim.o.background = node.background
      end
      write_to_conf(
        "theme = '" .. ui.theme .. "'",
        "theme = '" .. node.theme .. "'"
      )
      vim.cmd.colorscheme(node.theme)
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
