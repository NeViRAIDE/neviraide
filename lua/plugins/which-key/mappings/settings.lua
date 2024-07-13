local icon = require('stigmata.utils').icon

return {
  { '<leader>s', group = 'Settings', icon = icon('', 'gear') },
  {
    '<leader>sd',
    function() require('nevitabs.modules.components').toggle_datetime() end,
    desc = 'Date/time style',
  },
  {
    '<leader>si',
    function()
      require('neviraide-ui.utils.change_settings.indents').setIndents()
    end,
    desc = 'Toggle nonicons/devicons',
  },

  {
    '<leader>sI',
    function()
      require('neviraide-ui.utils.change_settings.icons').change_icons()
    end,
    desc = 'Change icons',
  },

  { '<leader>sl', group = 'Cursor line' },
  {
    '<leader>sle',
    function()
      require('neviraide-ui.utils.change_settings.cursorline').enable()
    end,
    desc = 'Enable cursorline',
  },
  {
    '<leader>sld',
    function()
      require('neviraide-ui.utils.change_settings.cursorline').disable()
    end,
    desc = 'Disable cursorline',
  },
  {
    '<leader>slt',
    function()
      require('neviraide-ui.utils.change_settings.cursorline').toggle()
    end,
    desc = 'Toggle cursorline',
  },
  { '<leader>sc', group = 'Cursor column' },
  {
    '<leader>sce',
    function()
      require('neviraide-ui.utils.change_settings.cursorcolumn').enable()
    end,
    desc = 'Enable cursorcolumn',
  },
  {
    '<leader>scd',
    function()
      require('neviraide-ui.utils.change_settings.cursorcolumn').disable()
    end,
    desc = 'Disable cursorcolumn',
  },
  {
    '<leader>sct',
    function()
      require('neviraide-ui.utils.change_settings.cursorcolumn').toggle()
    end,
    desc = 'Toggle cursorcolumn',
  },
  { '<leader>sn', group = 'Numbers' },
  {
    '<leader>sne',
    function() require('neviraide-ui.utils.change_settings.numbers').enable() end,
    desc = 'Enable numbers',
  },
  {
    '<leader>snd',
    function() require('neviraide-ui.utils.change_settings.numbers').disable() end,
    desc = 'Disable numbers',
  },
  {
    '<leader>snt',
    function() require('neviraide-ui.utils.change_settings.numbers').toggle() end,
    desc = 'Toggle numbers',
  },
  { '<leader>sr', group = 'Relative numbers' },
  {
    '<leader>sre',
    function()
      require('neviraide-ui.utils.change_settings.relativenumbers').enable()
    end,
    desc = 'Enable relativenumbers',
  },
  {
    '<leader>srd',
    function()
      require('neviraide-ui.utils.change_settings.relativenumbers').disable()
    end,
    desc = 'Disable relativenumbers',
  },
  {
    '<leader>srt',
    function()
      require('neviraide-ui.utils.change_settings.relativenumbers').toggle()
    end,
    desc = 'Toggle relativenumbers',
  },
  { '<leader>sp', group = 'Plugins' },
  { '<leader>spm', '<cmd>Lazy show<cr>', desc = 'Plugins manager' },
  { '<leader>spu', '<cmd>Lazy update<cr>', desc = 'Update plugins' },
}
