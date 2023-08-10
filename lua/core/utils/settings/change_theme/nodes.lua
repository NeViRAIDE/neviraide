local NuiTree = require('nui.tree')

---@param name string name you will see in tree
---@param colorscheme string name for command line
---@param background? string background
---@param pallete? string background pallete
---@return function
local treeNode = function(name, colorscheme, background, pallete)
  return NuiTree.Node({
    text = name,
    theme = colorscheme,
    background = background,
    pallete = pallete,
  })
end

return function()
  return {
    NuiTree.Node({ text = 'Catppuccin' }, {
      NuiTree.Node({ text = 'Dark' }, {
        treeNode('Frappe', 'catppuccin-frappe'),
        treeNode('Macchiato', 'catppuccin-macchiato'),
        treeNode('Mocha', 'catppuccin-mocha'),
      }),
      NuiTree.Node({ text = 'Light' }, {
        treeNode('Latte', 'catppuccin-latte'),
      }),
    }),
    NuiTree.Node({ text = 'Dracula' }, {
      treeNode('Classic', 'dracula'),
      treeNode('Soft', 'dracula-soft'),
    }),
    NuiTree.Node({ text = 'Everforest' }, {
      NuiTree.Node({ text = 'Dark' }, {
        treeNode('Soft', 'everforest', 'dark', 'soft'),
        treeNode('Medium', 'everforest', 'dark', 'medium'),
        treeNode('Hard', 'everforest', 'dark', 'hard'),
      }),
      NuiTree.Node({ text = 'Light' }, {
        treeNode('Soft', 'everforest', 'light', 'soft'),
        treeNode('Medium', 'everforest', 'light', 'medium'),
        treeNode('Hard', 'everforest', 'light', 'hard'),
      }),
    }),
    NuiTree.Node({ text = 'Gruvbox' }, {
      treeNode('Dark', 'gruvbox', 'dark'),
      treeNode('Light', 'gruvbox', 'light'),
    }),
    NuiTree.Node({ text = 'Kanagawa' }, {
      NuiTree.Node({ text = 'Dark' }, {
        treeNode('Wave', 'kanagawa-wave'),
        treeNode('Dragon', 'kanagawa-dragon'),
      }),
      NuiTree.Node({ text = 'Light' }, {
        treeNode('Lotus', 'kanagawa-lotus'),
      }),
    }),
    NuiTree.Node({ text = 'Material' }, {
      NuiTree.Node({ text = 'Dark' }, {
        treeNode('Darker', 'material-darker'),
        treeNode('Deep ocean', 'material-deep-ocean'),
        treeNode('Oceanic', 'material-oceanic'),
        treeNode('Palenight', 'material-palenight'),
      }),
      NuiTree.Node({ text = 'Light' }, {
        treeNode('Lighter', 'material-lighter'),
      }),
    }),
    NuiTree.Node({ text = 'One Dark' }, {
      NuiTree.Node({ text = 'Dark' }, {
        treeNode('Classic', 'onedark'),
        treeNode('Dark', 'onedark_dark'),
        treeNode('Vivid', 'onedark_vivid'),
      }),
      NuiTree.Node({ text = 'Light' }, {
        treeNode('OneLight', 'onelight'),
      }),
    }),
    NuiTree.Node({ text = 'Tokyo Night' }, {
      NuiTree.Node({ text = 'Dark' }, {
        treeNode('Moon', 'tokyonight-moon'),
        treeNode('Night', 'tokyonight-night'),
        treeNode('Storm', 'tokyonight-storm'),
      }),
      NuiTree.Node({ text = 'Light' }, {
        treeNode('Day', 'tokyonight-day'),
      }),
    }),
  }
end
