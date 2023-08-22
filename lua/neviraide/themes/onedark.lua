local ui = require('NEVIRAIDE')

return {
  -- FIX: not working on fly
  name = 'OneDark',
  -- require('onedark').load()
  colors = {
    { bg = 'dark', name = 'Dark', cmd = 'onedark', pallete = 'dark' },
    { bg = 'dark', name = 'Darker', cmd = 'onedark', pallete = 'darker' },
    { bg = 'dark', name = 'Cool', cmd = 'onedark', pallete = 'cool' },
    { bg = 'dark', name = 'Deep', cmd = 'onedark', pallete = 'deep' },
    { bg = 'dark', name = 'Warm', cmd = 'onedark', pallete = 'warm' },
    { bg = 'dark', name = 'Warmer', cmd = 'onedark', pallete = 'warmer' },
    { bg = 'light', name = 'Light', cmd = 'onedark', pallete = 'light' },
  },
  plugin = {
    'navarasu/onedark.nvim',
    version = '*',
    opts = {
      style = ui.pallete, -- Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light' ,
      transparent = ui.transparency,
      code_style = {
        comments = 'italic',
        keywords = 'italic,bold',
        functions = 'none',
        strings = 'none',
        variables = 'none',
      },
    },
    -- config = function(_, opts) require('onedark').setup(opts) end,
  },
}
