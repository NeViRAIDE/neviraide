local icon = require('neviraide-ui.icons.utils').icon

return {
  name = 'Settings' .. icon('', 'gear', 1),
  d = {
    function()
      require('neviraide-ui.buftabline.modules.components').toggle_datetime()
    end,
    'Date/time style',
  },
  i = {
    function()
      require('neviraide-ui.utils.change_settings.indents').setIndents()
    end,
    'Toggle nonicons/devicons',
  },

  I = {
    function()
      require('neviraide-ui.utils.change_settings.icons').change_icons()
    end,
    'Change icons',
  },

  l = {
    name = 'Cursor line',
    e = {
      function()
        require('neviraide-ui.utils.change_settings.cursorline').enable()
      end,
      'Enable cursorline',
    },
    d = {
      function()
        require('neviraide-ui.utils.change_settings.cursorline').disable()
      end,
      'Disable cursorline',
    },
    t = {
      function()
        require('neviraide-ui.utils.change_settings.cursorline').toggle()
      end,
      'Toggle cursorline',
    },
  },
  c = {
    name = 'Cursor column',
    e = {
      function()
        require('neviraide-ui.utils.change_settings.cursorcolumn').enable()
      end,
      'Enable cursorcolumn',
    },
    d = {
      function()
        require('neviraide-ui.utils.change_settings.cursorcolumn').disable()
      end,
      'Disable cursorcolumn',
    },
    t = {
      function()
        require('neviraide-ui.utils.change_settings.cursorcolumn').toggle()
      end,
      'Toggle cursorcolumn',
    },
  },
  n = {
    name = 'Numbers',
    e = {
      function() require('neviraide-ui.utils.change_settings.numbers').enable() end,
      'Enable numbers',
    },
    d = {
      function()
        require('neviraide-ui.utils.change_settings.numbers').disable()
      end,
      'Disable numbers',
    },
    t = {
      function() require('neviraide-ui.utils.change_settings.numbers').toggle() end,
      'Toggle numbers',
    },
  },
  r = {
    name = 'Relative numbers',
    e = {
      function()
        require('neviraide-ui.utils.change_settings.relativenumbers').enable()
      end,
      'Enable relativenumbers',
    },
    d = {
      function()
        require('neviraide-ui.utils.change_settings.relativenumbers').disable()
      end,
      'Disable relativenumbers',
    },
    t = {
      function()
        require('neviraide-ui.utils.change_settings.relativenumbers').toggle()
      end,
      'Toggle relativenumbers',
    },
  },
  C = {
    function()
      require('neviraide-ui.utils.change_settings.theme').choose_theme()
    end,
    'Colorscheme',
  },
}
