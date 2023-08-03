return {
  {
    'ggandor/lightspeed.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
  },

  {
    'xiyaowong/transparent.nvim',
    cmd = {
      'TransparentEnable',
      'TransparentDisable',
    },
    config = function()
      vim.api.nvim_set_hl(
        0,
        'NotifyBackground',
        vim.api.nvim_get_hl_by_name('Normal', true)
      )
      require('transparent').setup({
        extra_groups = {
          'FloatBorder',
          'NeoTreeNormal',
          'NeoTreeNormalNC',
          'NeoTreeEndOfBuffer',
          'NeoTreeStatusLine',
        },
      })
    end,
  },

  {
    'uga-rosa/ccc.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = function()
      return {
        highlighter = {
          auto_enable = true,
          excludes = { 'neo-tree' },
        },
      }
    end,
  },

  {
    'numToStr/Comment.nvim',
    keys = {
      { 'gcc', mode = 'n' },
      { 'gc', mode = 'v' },
      { 'gbc', mode = 'n' },
      { 'gb', mode = 'v' },
    },
    config = function(_, opts) require('Comment').setup(opts) end,
  },
}
