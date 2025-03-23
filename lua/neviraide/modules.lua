return {
  {
    'NeViRAIDE/neviraide-ui',
    dev = true,
    event = 'VeryLazy',
    opts = {
      kitty = {
        enable = true,
      },
      ui = {
        -- hyde = vim.g.hyde,
        notify = vim.g.notif,
      },
    },
  },
  {
    'NeViRAIDE/chameleon.nvim',
    dependencies = { { 'NeViRAIDE/stigmata.nvim', dev = true } },
    event = 'VeryLazy',
    dev = true,
    opts = { hyde = vim.g.hyde },
  },
  -- {
  --   'NeViRAIDE/whisper.nvim',
  --   event = 'VeryLazy',
  --   dev = true,
  -- },
  {
    'NeViRAIDE/harbinger.nvim',
    event = 'VimEnter',
    config = true,
    dev = true,
    opts = {
      open_on_start = true,
      layout = {
        rows = {
          -- Первая строка на всю ширину
          {
            height = '50%', -- Используем строку с процентом
            width = '100%', -- Ширина строки на 100%
            columns = {
              {
                height = '100%', -- Высота колонки на 100% строки
                width = '100%', -- Ширина колонки на 100% строки
                content = {
                  type = 'text',
                  value = {
                    'Welcome to the Harbinger Dashboard!',
                    'This is a fully customizable interface.',
                  },
                  alignment = { horizontal = 'center', vertical = 'top' },
                },
                active = false,
                highlights = {
                  fg = '#FFFFFF',
                  bg = '#000000',
                },
              },
            },
          },
          -- Вторая строка с разделением на три колонки
          {
            height = '50%',
            width = '100%',
            columns = {
              {
                height = '100%',
                width = '33%',
                rows = {
                  {
                    height = '33%',
                    width = '100%',
                    content = {
                      type = 'text',
                      value = {
                        'Left Column - Row 1 from lazy.nvim config',
                      },
                      alignment = { horizontal = 'center', vertical = 'middle' },
                    },
                    active = false,
                    highlights = {
                      fg = '#AAAAAA',
                      bg = '#1A1A1A',
                    },
                  },
                  {
                    height = '33%',
                    width = '100%',
                    content = {
                      type = 'text',
                      value = {
                        'Left Column - Row 2',
                      },
                      alignment = { horizontal = 'center', vertical = 'middle' },
                    },
                    active = false,
                    highlights = {
                      fg = '#FF0000',
                      bg = '#2E2E2E',
                    },
                  },
                  {
                    height = '34%',
                    width = '100%',
                    columns = {
                      {
                        width = '50%',
                        height = '100%',
                        content = {
                          type = 'text',
                          value = {
                            'Subsection - Left Part of Third Row',
                          },
                          alignment = {
                            horizontal = 'center',
                            vertical = 'middle',
                          },
                        },
                        active = false,
                        highlights = {
                          fg = '#00FF00',
                          bg = '#444444',
                        },
                      },
                      {
                        width = '50%',
                        height = '100%',
                        content = {
                          type = 'text',
                          value = {
                            'Subsection - Right Part of Third Row',
                          },
                          alignment = {
                            horizontal = 'center',
                            vertical = 'middle',
                          },
                        },
                        active = false,
                        highlights = {
                          fg = '#00FFFF',
                          bg = '#555555',
                        },
                      },
                    },
                  },
                },
              },
              {
                width = '33%',
                height = '100%',
                content = {
                  type = 'buttons',
                  items = {
                    {
                      label = 'New File',
                      command = ':ene',
                      icon = '📄',
                      highlights = {
                        fg = '#FF00FF',
                        bg = '#666666',
                      },
                    },
                    {
                      label = 'Find File',
                      command = ':Telescope find_files',
                      icon = '🔍',
                      highlights = {
                        fg = '#FFFF00',
                        bg = '#777777',
                      },
                    },
                  },
                },
                active = true,
                highlights = {
                  fg = '#00FFFF',
                  bg = '#000000',
                },
              },
              {
                width = '34%',
                height = '100%',
                rows = {
                  {
                    height = '50%',
                    width = '100%',
                    content = {
                      type = 'text',
                      value = {
                        'Right Column - Top Row',
                      },
                      alignment = { horizontal = 'center', vertical = 'middle' },
                    },
                    active = false,
                    highlights = {
                      fg = '#FF9900',
                      bg = '#888888',
                    },
                  },
                  {
                    height = '50%',
                    width = '100%',
                    content = {
                      type = 'text',
                      value = {
                        'Right Column - Bottom Row',
                      },
                      alignment = { horizontal = 'center', vertical = 'middle' },
                    },
                    active = false,
                    highlights = {
                      fg = '#99FF00',
                      bg = '#999999',
                    },
                  },
                },
              },
            },
          },
        },
      },
      borders = 'rounded', -- Настройка границ для активных секций
      keymaps = {
        toggle_dashboard = '<leader>db', -- Клавиша для переключения дашборда
        navigate_sections = '<Tab>', -- Клавиша для перехода между секциями
        navigate_buttons = '<Down>', -- Клавиша для перехода по кнопкам
        execute_button = '<Enter>', -- Клавиша для выполнения команды кнопки
      },
    },
  },
  {
    'NeViRAIDE/neviline.nvim',
    -- event = 'UIEnter',
    event = 'VeryLazy',
    dev = true,
  },
  {
    'NeViRAIDE/nevitabs.nvim',
    event = { 'TabNew', 'TabClosed', 'BufRead' },
    dev = true,
  },
  {
    'NeViRAIDE/diagnoz.nvim',
    event = 'LspAttach',
    dev = true,
    config = true,
  },
  {
    'NeViRAIDE/nekifoch.nvim',
    dev = true,
    build = 'chmod +x ./install.sh && ./install.sh',
    cmd = 'Nekifoch',
    -- config = true,
    opts = {
      borders = vim.g.b,
    },
  },
  -- {
  --   dir = '~/GitHub/neviraide/test_plugin',
  --   -- dir = '~/.local/share/nvim/lazy/test_plugin',
  --   build = 'make',
  --   lazy = false,
  --   opts = { border = vim.g.b },
  --   -- config = function() require('test_plugin') end,
  -- },
}
