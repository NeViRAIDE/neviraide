local NuiTree = require("nui.tree")
local NuiLine = require("nui.line")
local event = require('nui.utils.autocmd').event
local Popup = require("nui.popup")

---@type integer number of themes installed
local theme_count = #require('Themes')

return function()
  local popup = Popup({
    position = { row = 3, col = '100%' },
    size = { width = 20, height = theme_count },
    enter = true,
    focusable = true,
    zindex = 50,
    relative = "editor",
    border = {
      padding = {
        top = 1,
        bottom = 1,
        left = 2,
        right = 2,
      },
      style = "rounded",
      text = { top = " Colorschemes ", top_align = "right" },
    },
    buf_options = {
      modifiable = false,
      readonly = true,
      filetype = 'nui_themes',
    },
    win_options = {
      winblend = 10,
      winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
    },
  })

  popup:on(event.BufLeave, function() popup:unmount() end)

  popup:mount()

  popup:map("n", "q", function()
    popup:unmount()
  end, { noremap = true })

  ---@param name string name you will see in tree
  ---@param colorscheme string name for command line
  ---@param background? string background
  ---@param custom? function custom parameters
  ---@return function
  local treeNode = function(name, colorscheme, background, custom)
    return NuiTree.Node({
      text = name,
      theme = colorscheme,
      background = background,
      pallete = custom
    })
  end

  local tree = NuiTree({
    winid = popup.winid,
    nodes = {
      NuiTree.Node({ text = "Catppuccin" }, {
        NuiTree.Node({ text = "Dark" }, {
          treeNode("Frappe", "catppuccin-frappe"),
          treeNode("Mocha", "catppuccin-mocha"),
          treeNode("Macchiato", "catppuccin-macchiato"),
        }),
        NuiTree.Node({ text = "Light" }, {
          treeNode("Latte", "catppuccin-latte"),
        }),
      }),
      NuiTree.Node({ text = "Dracula" }, {
        treeNode("Classic", "dracula"),
        treeNode("Soft", "dracula-soft"),
      }),
      NuiTree.Node({ text = "Everforest" }, {
        NuiTree.Node({ text = "Dark" }, {
          treeNode("Soft", "everforest", 'dark', function()
            vim.cmd([[
            let g:everforest_background="soft"
            let g:everforest_better_performance=1
            ]])
          end),
          treeNode("Medium", "everforest", 'dark', function()
            vim.cmd([[
              let g:everforest_background="medium"
              let g:everforest_better_performance=1
              ]])
          end),
          treeNode("Hard", "everforest", 'dark',
            function()
              vim.cmd([[
              let g:everforest_background="hard"
              let g:everforest_better_performance=1
              ]])
            end
          ),
        }),
        NuiTree.Node({ text = "Light" }, {
          treeNode("Soft", "everforest", 'light',
            function()
              vim.cmd([[
            let g:everforest_background="soft"
            let g:everforest_better_performance=1
            ]])
            end
          ),
          treeNode("Medium", "everforest", 'light',
            function()
              vim.cmd([[
            let g:everforest_background="medium"
            let g:everforest_better_performance=1
            ]])
            end
          ),
          treeNode("Hard", "everforest", 'light',
            function()
              vim.cmd([[
            let g:everforest_background="hard"
            let g:everforest_better_performance=1
            ]])
            end
          ),
        }),
      }),
      NuiTree.Node({ text = "Gruvbox" }, {
        treeNode("Dark", "gruvbox", "dark"),
        treeNode("Light", "gruvbox", "light"),
      }),
      NuiTree.Node({ text = "Kanagawa" }, {
        NuiTree.Node({ text = "Dark" }, {
          treeNode("Wave", "kanagawa-wave"),
          treeNode("Dragon", "kanagawa-dragon"),
        }),
        NuiTree.Node({ text = "Light" }, {
          treeNode("Lotus", "kanagawa-lotus"),
        }),
      }),
      NuiTree.Node({ text = "Material" }, {
        NuiTree.Node({ text = "Dark" }, {
          treeNode("Darker", "material-darker"),
          treeNode("Deep ocean", "material-deep-ocean"),
          treeNode("Oceanic", "material-oceanic"),
          treeNode("Palenight", "material-palenight"),
        }),
        NuiTree.Node({ text = "Light" }, {
          treeNode("Lighter", "material-lighter"),
        }),
      }),
      NuiTree.Node({ text = "One Dark" }, {
        NuiTree.Node({ text = "Dark" }, {
          treeNode("Classic", "onedark"),
          treeNode("Dark", "onedark_dark"),
          treeNode("Vivid", "onedark_vivid"),
        }),
        NuiTree.Node({ text = "Light" }, {
          NuiTree.Node({ text = "OneLight", theme = "onelight" }),
        }),
      }),
      NuiTree.Node({ text = "Tokyo Night" }, {
        NuiTree.Node({ text = "Dark" }, {
          NuiTree.Node({ text = "Moon", theme = "tokyonight-moon" }),
          NuiTree.Node({ text = "Night", theme = "tokyonight-night" }),
          NuiTree.Node({ text = "Storm", theme = "tokyonight-storm" }),
        }),
        NuiTree.Node({ text = "Light" }, {
          NuiTree.Node({ text = "Day", theme = "tokyonight-day" }),
        }),
      }),
    },
    prepare_node = function(node)
      local line = NuiLine()
      line:append(string.rep("  ", node:get_depth() - 1))
      if node:has_children() then
        line:append(node:is_expanded() and " " or " ", "SpecialChar")
      else
        line:append("  ")
      end
      line:append(node.text)
      return line
    end,
  })

  local map_options = { noremap = true, nowait = true }

  popup:map("n", "<CR>", function()
    local node = tree:get_node()
    if node.theme then
      if node.background then
        if node.pallete then
          vim.o.background = node.background
          node.pallete()
          vim.cmd.colorscheme(node.theme)
        end
        vim.o.background = node.background
        vim.cmd.colorscheme(node.theme)
      else
        vim.cmd.colorscheme(node.theme)
      end
    elseif node:collapse() then
      tree:render()
    else
      node:expand()
      tree:render()
    end
  end, map_options)

  -- collapse current node
  popup:map("n", "h", function()
    local node = tree:get_node()
    if node:collapse() then
      tree:render()
    end
  end, map_options)

  -- collapse all nodes
  popup:map("n", "H", function()
    local updated = false
    for _, node in pairs(tree.nodes.by_id) do
      updated = node:collapse() or updated
    end
    if updated then
      tree:render()
    end
  end, map_options)

  -- expand current node
  popup:map("n", "l", function()
    local node = tree:get_node()
    if node:expand() then
      tree:render()
    end
  end, map_options)

  -- expand all nodes
  popup:map("n", "L", function()
    local updated = false
    for _, node in pairs(tree.nodes.by_id) do
      updated = node:expand() or updated
    end
    if updated then
      tree:render()
    end
  end, map_options)

  tree:render()
end
