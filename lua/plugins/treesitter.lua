return {
  'nvim-treesitter/nvim-treesitter',
  version = false,
  event = { 'BufReadPost', 'BufNewFile' },
  build = function()
    require('nvim-treesitter.install').update({ with_sync = true })()
  end,
  dependencies = {
    'windwp/nvim-ts-autotag',
    'nvim-treesitter/nvim-treesitter-context',
    'JoosepAlviste/nvim-ts-context-commentstring',
  },
  opts = {
    ensure_installed = { 'lua', 'hyprlang', 'rust', 'rasi' },
    auto_install = true,
    highlight = {
      enable = true,
      use_languagetree = true,
    },
    indent = { enable = true },
    tree_docs = { enable = true },
    autotag = { enable = true },
    incremental_selection = { enable = true },
    textobjects = {
      enable = true,
      lsp_interop = { enable = true },
      move = { enable = true, set_jumps = true },
      select = { enable = true },
      swap = { enable = true },
    },
  },
  config = function(_, opts)
    ---@type string
    local xdg_config = vim.env.XDG_CONFIG_HOME or vim.env.HOME .. '/.config'

    ---@param path string
    local function have(path)
      return vim.uv.fs_stat(xdg_config .. '/' .. path) ~= nil
    end

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

    if have('hypr') then add('hyprlang') end
    if have('fish') then add('fish') end
    if have('rofi') or have('wofi') then add('rasi') end
  end,
}
