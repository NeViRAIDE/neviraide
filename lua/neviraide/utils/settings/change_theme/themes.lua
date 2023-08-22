-- TODO: create own theme plugin

---@param theme string
---@return table
local function add_theme(theme) return require('neviraide.themes.' .. theme) end

return {
  add_theme('catppuccin'),
  -- TODO: find analog dracula (highlight noice cmdline)
  -- add_theme('dracula'),
  add_theme('everforest'),
  add_theme('gruvbox'),
  add_theme('kanagawa'),
  add_theme('material'),
  add_theme('nightfox'),
  add_theme('nordic'),
  add_theme('onedark'),
  add_theme('tokyonight'),
  add_theme('vscode'),
}
