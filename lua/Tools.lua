return {
  {
    'ggandor/lightspeed.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
  },

  {
    'xiyaowong/transparent.nvim',
    cmd = 'TransparentToggle',
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
