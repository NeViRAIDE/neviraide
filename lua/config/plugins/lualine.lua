local M = {
  "nvim-lualine/lualine.nvim",
  event = "BufReadPre",
  -- event = "VeryLazy",
  config = function()
    require('config.plugins.lualine').setup()
  end
}

function M.setup()
  local navic = require("nvim-navic")
  local lualine = require('lualine')

  local function diff_source()
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns then
      return {
        added = gitsigns.added,
        modified = gitsigns.changed,
        removed = gitsigns.removed
      }
    end
  end

  local function branch_source()
    local msg = 'Not in a git repository'
    local git_branch = vim.b.gitsigns_head
    if git_branch then return git_branch end
    return msg
  end

  local conditions = {
    buffer_not_empty = function()
      return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
    end,
    hide_in_width = function()
      return vim.fn.winwidth(0) > 80
    end,
    check_git_workspace = function()
      local filepath = vim.fn.expand('%:p:h')
      local gitdir = vim.fn.finddir('.git', filepath .. ';')
      return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
  }

  local function get_file_path()
    if vim.fn.bufname('%') == '' then return '' end
    local sep = '/'
    local path_list =
    vim.split(string.gsub(vim.fn.expand('%:~:.:h'), '%%', ''), sep)
    local file_path = ''
    for _, cur in ipairs(path_list) do
      file_path = (cur == '.' or cur == '~') and ''
          or file_path
          .. cur
          .. ' %#LspSagaWinbarSep#'
          .. '▶ '
          .. '%#lualine_c_filetype_normal#'
    end
    return file_path
  end

  local custom_fname = require('lualine.components.filename'):extend()
  local highlight = require('lualine.highlight')

  function custom_fname:init(options)
    custom_fname.super.init(self, options)
    self.options.symbols.modified = '🖊️'
    self.options.symbols.readonly = '🔏'
    self.options.symbols.newfile = ''
    self.options.symbols.unnamed = 'ﱤ'
    self.status_colors = {
      newfile = highlight.create_component_highlight_group(
        { bg = color.none, fg = color.green, gui = 'bold' },
        'filename_status_newfile',
        self.options
      ),

      saved = highlight.create_component_highlight_group(
        { bg = color.none, fg = color.fg, gui = 'bold' },
        'filename_status_saved',
        self.options
      ),
      modified = highlight.create_component_highlight_group(
        { bg = color.none, fg = color.red, gui = 'bold,italic' },
        'filename_status_modified',
        self.options
      ),
    }
    if self.options.color == nil then self.options.color = '' end
  end

  function custom_fname:newfile()
    local data = custom_fname.super.update_status(self)
    data = highlight.component_format_highlight(self.status_colors.newfile)
        .. data
    return data
  end

  function custom_fname:update_status()
    local data = custom_fname.super.update_status(self)
    data = highlight.component_format_highlight(
      vim.bo.modified and self.status_colors.modified or self.status_colors.saved
    ) .. data
    return data
  end

  local function winbar()
    return {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {
        {
          function() return ' ' end,
          color = { bg = color.none },
          padding = { left = 2, right = 0 },
        },
        {
          get_file_path,
          cond = conditions.hide_in_width or conditions.buffer_not_empty,
          color = { bg = color.none },
          padding = { left = 0, right = 0 },
        },
        {
          'filetype',
          icon_only = true,
          cond = conditions.buffer_not_empty,
          color = { bg = color.none },
          padding = { left = 0, right = 0 },
        },
        {
          custom_fname,
          newfile_status = true,
          cond = conditions.buffer_not_empty,
          padding = { left = 1, right = 0 },
        },
        {
          function() return ' ▶' end,
          cond = navic.is_available and conditions.buffer_not_empty,
          color = { bg = color.none, fg = color.red },
          padding = { left = 0, right = 0 },
        },
        {
          navic.get_location,
          color = { bg = color.none },
          cond = navic.is_available or conditions.buffer_not_empty
        },
      },
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    }
  end

  local function modeAndLocation()
    return {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {
        {
          function()
            local half_window_width = vim.api.nvim_win_get_width(0) / 2 - 15
            return string.rep(' ', half_window_width)
          end,
          padding = { left = 0, right = 0 },
        },
        {
          function() return '' end,
          color = function() return { fg = color.bg, bg = color.none } end,
          padding = { left = 0, right = 0 },
        },
        {
          'location',
          icon = '',
          cond = conditions.buffer_not_empty,
          color = { bg = color.bg, gui = 'italic' },
          padding = { left = 1, right = 1 },
        },
        {
          function()
            local mode_icons = {
              n = 'Normal',
              i = 'Insert',
              c = 'Command',
              v = '-isual',
              [''] = '' .. '-Block',
              V = '' .. '-Line',
              R = 'Replace',
              t = 'Terminal ',
            }
            return mode_icons[vim.fn.mode()]
          end,
          color = function()
            local mode_color = {
              n = color.green,
              i = color.blue,
              v = color.magenta,
              [''] = color.magenta,
              V = color.magenta,
              c = color.yellow,
              R = color.red,
              t = color.darkYellow,
            }
            return {
              fg = mode_color[vim.fn.mode()],
              gui = 'bold,italic',
              bg = color.bg,
            }
          end,
          padding = { left = 1, right = 1 },
        },
        {
          'progress',
          cond = conditions.buffer_not_empty,
          color = { fg = color.fg, gui = 'bold', bg = color.bg },
          padding = { left = 1, right = 1 },
        },
        {
          require("lazy.status").updates,
          cond = require("lazy.status").has_updates,
          color = { fg = "#ff9e64", bg = color.bg },
        },
        {
          function() return '' end,
          color = function() return { fg = color.bg, bg = color.none } end,
          padding = { left = 0, right = 0 },
        },
      },
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    }
  end

  local function left_separator() return '' end

  local function right_separator() return '' end

  local function lsp_source()
    local msg = 'No Active LSP'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then return msg end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end

  local function interpreter()
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    if buf_ft == 'lua' then
      return _VERSION
    elseif buf_ft == 'go' then
      local go_version = vim.fn.execute(':go version')
      return go_version
    elseif buf_ft == 'python' then
      local python_version = vim.fn.execute(':python import sys; print(sys.version)')
      return 'Python ' .. python_version:match('%d[^ ]*')
    end
    return buf_ft:gsub('^%l', string.upper)
  end

  local function virtual_env()
    local clients = vim.lsp.get_active_clients()
    for _, client in ipairs(clients) do
      if client.name == 'pyright' and vim.env.VIRTUAL_ENV then
        local virtual_env_path = vim.env.VIRTUAL_ENV
        return '(' .. virtual_env_path:match('.virtualenvs/(.*)') .. ')'
      end
      return ''
    end
    return ''
  end

  local function statusline()
    return {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {
        {
          left_separator,
          color = { fg = color.bg, bg = color.none },
          padding = { left = 3, right = 0 },
        },
        {
          lsp_source,
          icon = '',
          color = { bg = color.bg },
        },
        {
          function() return '|' end,
          color = { fg = 'Grey', bg = color.bg, gui = 'none' },
          cond = conditions.buffer_not_empty,
          padding = { left = 0, right = 0 },
        },
        {
          'diagnostics',
          sources = { 'nvim_diagnostic' },

          symbols = { error = ' ', warn = '⚠ ', info = ' ', hint = ' ' },
          diagnostics_color = {
            color_error = { fg = color.red },
            color_warn = { fg = color.yellow },
            color_info = { fg = color.blue },
            color_hint = { fg = color.magenta },
          },
          always_visible = true,
          color = { bg = color.bg },
          cond = conditions.buffer_not_empty,
        },
        {
          right_separator,
          color = { fg = color.bg, bg = color.none },
          padding = { left = 0, right = 0 },
        },
        { function() return '%=' end },
        {
          left_separator,
          color = { fg = color.bg, bg = color.none },
          cond = conditions.hide_in_width or conditions.buffer_not_empty,
          padding = { left = 0, right = 0 },
        },
        {
          'filesize',
          cond = conditions.hide_in_width or conditions.buffer_not_empty,
          color = { bg = color.bg },
        },
        {
          'fileformat',
          icons_enabled = true,
          cond = conditions.hide_in_width or conditions.buffer_not_empty,
          color = { fg = color.fg, bg = color.bg },
          symbols = {
            unix = 'LF ',
            dos = 'CRLF ',
            mac = 'CR ',
          },
        },
        {
          'o:encoding',
          fmt = string.upper,
          icons_enabled = true,
          cond = conditions.hide_in_width or conditions.buffer_not_empty,
          color = { fg = color.fg, bg = color.bg },
        },
        {
          function() return vim.o.tabstop .. ' spaces' end,
          cond = conditions.hide_in_width or conditions.buffer_not_empty,
          color = { bg = color.bg },
        },
        {
          interpreter,
          color = { fg = color.fg, bg = color.bg, gui = 'italic' },
          cond = conditions.hide_in_width or conditions.buffer_not_empty,
        },
        {
          virtual_env,
          color = { bg = color.bg, gui = 'italic' },
          cond = conditions.hide_in_width or conditions.buffer_not_empty,
          padding = { left = 0, right = 1 },
        },
        {
          right_separator,
          color = { fg = color.bg, bg = color.none },
          cond = conditions.hide_in_width or conditions.buffer_not_empty,
          padding = { left = 0, right = 0 },
        },
      },
      lualine_x = {
        {
          left_separator,
          color = { fg = color.bg, bg = color.none },
          padding = { left = 0, right = 0 },
        },
        {
          'diff',
          source = diff_source,
          color = { bg = color.bg },
          symbols = {
            added    = " ",
            modified = " ",
            removed  = " ",
          },
          diff_color = {
            added = { fg = color.green },
            modified = { fg = color.blue },
            removed = { fg = color.red },
            ignored = { fg = color.red },
            renamed = { fg = color.red },
          },
        },
        {
          branch_source,
          icon = '',
          color = { fg = color.orange, gui = 'bold', bg = color.bg },
        },
        {
          right_separator,
          color = { fg = color.bg, bg = color.none },
          padding = { left = 0, right = 3 },
        },
      },
      lualine_y = {},
      lualine_z = {},
    }
  end

  -- Config
  local config = {
    extensions = {
      'quickfix',
      'neo-tree',
      'toggleterm',
      'nvim-dap-ui',
      'man',
      'symbols-outline',
    },
    disabled_filetypes = {
      'mason',
      'neo-tree',
      'TelescopePrompt',
      'toggleterm',
      'lspsagaoutline',
      'terminal',
      'term',
      'help',
      'dashboard',
      'man'
    },
    options = {
      component_separators = '',
      section_separators = '',
      theme = {
        normal = { c = { fg = color.fg, bg = color.none } },
        inactive = { c = { fg = color.fg, bg = color.none } },
      },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_y = {},
      lualine_z = {},
      lualine_c = {},
      lualine_x = {},
    },
    tabline = winbar(),
    winbar = modeAndLocation(),
    sections = statusline(),
    globalstatus = true,
  }

  lualine.setup(config)
end

return M
