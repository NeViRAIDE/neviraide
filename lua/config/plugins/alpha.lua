local M = {
  'goolord/alpha-nvim',
  lazy = false,
}

function M.config()
  require('utils')
  require('alpha.term')

  -- FIX: set width dynamic
  local window_width = math.floor(vim.o.columns)
  local term_height = 10
  local term_or_text = nil
  local term_padding = nil
  local ret = os.execute('command -v neo &>/dev/null')

  local function nvim_version()
    local nvim_full_version_info = vim.fn.execute('version')
    if nvim_full_version_info:match('NVIM') then
      return nvim_full_version_info:match('NVIM [^\n]*')
    else
      return 'Check your alpha configuration file'
    end
  end

  ---@param sc string
  ---@param txt string
  ---@param keybind string?
  ---@param keybind_opts table?
  ---@param opts table?
  ---@return table
  local function button(sc, txt, keybind, keybind_opts, opts)
    local def_opts = {
      cursor = 0,
      align_shortcut = 'right',
      hl_shortcut = 'Boolean',
      hl = 'AlphaButton',
      width = 23,
      position = 'center',
    }
    opts = opts and vim.tbl_extend('force', def_opts, opts) or def_opts
    opts.shortcut = sc
    local sc_ = sc:gsub('%s', '*'):gsub('SPC', '<Leader>')
    local on_press = function()
      local key = vim.api.nvim_replace_termcodes(
        keybind or sc_ .. '<Ignore>',
        true,
        false,
        true
      )
      vim.api.nvim_feedkeys(key, 't', false)
    end
    if keybind then
      keybind_opts = vim.F.if_nil(
        keybind_opts,
        { noremap = true, silent = true, nowait = true }
      )
      opts.keymap = { 'n', sc_, keybind, keybind_opts }
    end
    return { type = 'button', val = txt, on_press = on_press, opts = opts }
  end

  if ret == 0 and term ~= 'linux' and term ~= 'screen' then
    term_or_text = {
      type = 'terminal',
      command = "neo --fps=60 --speed=6 -D -a -m 'NEVIRAIDE' -d 0.5 -l 1,1",
      width = window_width,
      height = term_height,
      opts = {
        position = 'center',
        redraw = true,
        window_config = { zindex = 1 },
      },
    }
    term_padding = { type = 'padding', val = term_height }
  else
    term_or_text = {
      type = 'text',
      val = {
        '                      01001110 01100101 01101111 01110110 01101001 01101101',
        '    01001001 01101110 01110100 01100101 01100111 01110010 01100001 01110100 01100101 01100100',
        '01000100 01100101 01110110 01100101 01101100 01101111 01110000 01101101 01100101 01101110 01110100',
        '01000101 01101110 01110110 01101001 01110010 01101111 01101110 01101101 01100101 01101110 01110100',
        '                                        01100010 01111001',
        '    01010010 01000001 01110000 01110010 01101111 01100111 01110010 01100001 01101101 01101101',
        '',
        '                                      . . . NEVIRAIDE . . .',
        '',
      },
      opts = { position = 'center', hl = 'DashboardHeader' },
    }
    term_padding = {
      type = 'padding',
      val = vim.fn.max({ 2, vim.fn.floor(vim.fn.winheight(0) * 0.2) }),
    }
  end

  local config = {
    layout = {
      term_padding,
      term_or_text,
      { type = 'padding', val = 3 },
      {
        type = 'group',
        val = {
          button(
            icon('file', '', ' '),
            icon('dot', ' ', '* ') .. 'Create new file',
            ':lua require("utils.startup").dashNewFile()<cr>'
          ),
          button(
            icon('search', '', ' '),
            icon('dot', ' ', '* ') .. 'Find file',
            ':Telescope find_files<cr>'
          ),
          button(
            icon('history', '', ' '),
            icon('dot', ' ', '* ') .. 'Recent files',
            ':Telescope oldfiles<cr>'
          ),
          button(
            icon('quote', '', ' '),
            icon('dot', ' ', '* ') .. 'Find word',
            ':Telescope live_grep<cr>'
          ),
          button(
            icon('project', '', ' '),
            icon('dot', ' ', '* ') .. 'Session manager',
            ':lua require("utils.startup").sessions:mount()<cr>'
          ),
          button(
            icon('tasklist', '', ' '),
            icon('dot', ' ', '* ') .. 'TODO list',
            ':TodoTelescope theme=ivy initial_mode=normal previewer=false layout_config={bottom_pane={height=14}}<cr>'
          ),
          button(
            icon('heart', '', ' '),
            icon('dot', ' ', '* ') .. 'Check health',
            ':checkhealth<cr>'
          ),
          button(
            icon('plug', '', ' '),
            icon('dot', ' ', '* ') .. 'Plugin manager',
            ':Lazy<cr>'
          ),
          button(
            icon('sign-out', '', ' '),
            icon('dot', ' ', '* ') .. 'Exit',
            ':qa<cr>'
          ),
        },
        opts = {
          hl = 'Constant',
        },
      },
      { type = 'padding', val = 1 },
      {
        type = 'text',
        val = nvim_version(),
        opts = { position = 'center', hl = 'Comment' },
      },
      { type = 'padding', val = 1 },
      {
        type = 'text',
        val = require('alpha.fortune')(),
        opts = { position = 'center', hl = 'AlphaFortune' },
      },
    },
  }

  require('alpha').setup(config)
end

return M
