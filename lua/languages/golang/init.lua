local config = require('neviraide.utils').con

return {
  {
    'olexsmir/gopher.nvim',
    ft = 'go',
    config = config('gopher'),
  },
}
