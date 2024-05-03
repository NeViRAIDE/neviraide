local utils = require('plugins.treesitter.utils')

return function(_, opts)
  dofile(vim.g.ntc .. 'syntax')
  dofile(vim.g.ntc .. 'treesitter')
  require('nvim-treesitter.configs').setup(opts)

  local function add(lang)
    if type(opts.ensure_installed) == 'table' then
      table.insert(opts.ensure_installed, lang)
    end
  end

  vim.filetype.add({
    extension = { rasi = 'rasi' },
    pattern = {
      ['.*/waybar/config'] = 'jsonc',
      ['.*/mako/config'] = 'dosini',
      ['.*/kitty/*.conf'] = 'bash',
      ['.*/hypr/.*%.conf'] = 'hyprlang',
    },
  })

  local ft = require('Comment.ft')
  ft.hyprlang = '#%s'

  add('git_config')

  if utils.have('hypr') then add('hyprlang') end
  if utils.have('fish') then add('fish') end
  if utils.have('rofi') or utils.have('wofi') then add('rasi') end
end
