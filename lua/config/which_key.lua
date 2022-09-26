require('which-key').setup({
  plugins = {
    marks = true,
    registers = true,
    spelling = { enabled = true, suggestions = 20 },
    presets = {
      operators = true,
      motions = true,
      text_objects = true,
      windows = true,
      nav = true,
      z = true,
      g = true,
    },
  },
  operators = { gc = 'Comments' },
  key_labels = {
    ['<space>'] = 'Space',
    ['<cr>'] = 'Enter',
    ['<CR>'] = 'Enter',
    ['<tab>'] = 'TAB',
    ['<c-w>'] = 'Ctrl + w',
    ['<C-S>'] = 'Ctrl + s',
    ['<C-L>'] = 'Ctrl + l',
    ['<C-Bslash>'] = 'Ctrl + \\',
    ['<C-P>'] = 'Ctrl + p',
    ['<C-H>'] = 'Ctrl + h',
    ['<C-l>'] = 'Ctrl + l',
  },
  icons = {
    breadcrumb = icon('chevron-right'),
    separator = icon('arrow-right'),
    group = icon('plus'),
  },
  popup_mappings = { scroll_down = '<c-j>', scroll_up = '<c-k>' },
  window = {
    border = 'rounded',
    position = 'bottom',
    margin = { 1, 1, 1, 1 },
    padding = { 1, 1, 1, 1 },
    winblend = 10,
  },
  layout = {
    height = { min = 5, max = 30 },
    width = { min = 20, max = 70 },
    spacing = 14,
    align = 'center',
  },
  hidden = {
    '<Plug>',
    'require',
    'execute v:count .',
    '<silent>',
    ':',
    '<Cmd>',
    '<CR>',
    'call',
    'lua',
    '^:',
    '^ ',
    '("nvim-treesitter.textsubjects")',
  },
  ignore_missing = false,
  show_help = true,
  triggers = 'auto',
  triggers_blacklist = { i = { 'j', 'k' }, v = { 'j', 'k' } },
})

local function wk_register(...)
  local args = { ... }
  if_require(
    'which-key',
    function(wk) return wk.register(unpack(args)) end,
    function(_)
      vim.api.nvim_err_writeln(
        'WhichKeys not installed; cannot apply mappings!'
      )
    end
  )
end

local function setup()
  wk_register({
    ['<c-s>'] = { ':wa<cr>', 'Save all opened files' },
    ['<leader>'] = {
      name = 'Plugins and features ' .. icon('rocket'),
      D = { ':Dashboard<cr>', 'Dashboard ' .. icon('device-desktop') },
      S = { ':SessionSave<cr>', 'Save session ' .. icon('clock') },
      b = {
        name = 'Buffers ' .. icon('versions'),
        p = { ':bprev<cr>', 'Previous' },
        n = { ':bnext<cr>', 'Next' },
        d = { ':bdelete<cr>', 'Delete' },
        l = { '<cmd>Telescope buffers<cr>', 'List' },
        m = { ':WindowsMaximize<cr>', 'Fullscreen size' },
      },
      g = {
        name = 'GIT ' .. icon('git-branch'),
        l = { ':lua lazygit_toggle()<CR>', 'LazyGIT' },
        r = { ':Gitsigns reset_hunk<cr>', 'Reset hunk' },
        b = { ':Gitsigns blame_line<cr>', 'Blame line' },
        d = { ':Gitsigns diffthis<cr>', 'Diff this' },
        n = { ':Gitsigns next_hunk<cr>', 'Go to next hunk' },
        p = { ':Gitsigns prev_hunk<cr>', 'Go to previous hunk' },
        P = { ':Gitsigns preview_hunk<cr>', 'Preview hunk' },
        t = {
          name = 'Toggle',
          l = {
            ':Gitsigns toggle_linehl<CR>',
            'Line highlighting',
          },
          n = {
            ':Gitsigns toggle_numhl<CR>',
            'Line numbers highlighting',
          },
          s = {
            ':Gitsigns toggle_signs<CR>',
            'Signs',
          },
          w = {
            ':Gitsigns toggle_word_diff<CR>',
            'Word diff',
          },
          d = {
            ':Gitsigns toggle_deleted<CR>',
            'Deleted',
          },
          b = {
            ':Gitsigns toggle_current_line_blame<CR>',
            'Current line blame',
          },
        },
      },
      f = {
        ':NvimTreeFindFileToggle<cr>',
        'File explorer ' .. icon('file-directory'),
      },
      N = {
        name = 'Neogen ' .. icon('comment'),
        a = { ':Neogen<cr>', 'Create annotation(autodetect)' },
        f = { ':Neogen func<cr>', 'Create function annotation' },
        c = { ':Neogen class<cr>', 'Create class annotation' },
        t = { ':Neogen type<cr>', 'Create type annotation' },
        F = { ':Neogen file<cr>', 'Create file annotation' },
      },
      c = {
        name = 'Color Picker ' .. icon('paintbrush'),
        p = { ':CccPick<cr>', 'Pick color' },
        c = { ':CccConvert<cr>', 'Conver color' },
      },
      n = {
        name = 'Notes ' .. icon('checklist'),
        l = {
          ':TodoTelescope theme=ivy initial_mode=normal previewer=false layout_config={bottom_pane={height=12}}<cr>',
          'Notes list',
        },
        f = {
          'OFIX: <esc>:lua require("Comment.api").toggle.linewise.current()<cr>A',
          'FIX',
        },
        t = {
          'OTODO: <esc>:lua require("Comment.api").toggle.linewise.current()<cr>A',
          'TODO',
        },
        h = {
          'OHACK: <esc>:lua require("Comment.api").toggle.linewise.current()<cr>A',
          'HACK',
        },
        w = {
          'OWARN: <esc>:lua require("Comment.api").toggle.linewise.current()<cr>A',
          'WARN',
        },
        p = {
          'OPERF: <esc>:lua require("Comment.api").toggle.linewise.current()<cr>A',
          'PERF',
        },
        n = {
          'ONOTE: <esc>:lua require("Comment.api").toggle.linewise.current()<cr>A',
          'NOTE',
        },
      },
      t = {
        name = 'Telescope ' .. icon('telescope'),
        a = { '<cmd>Telescope autocommands<cr>', 'Autocommands' },
        m = { '<cmd>Telescope man_pages<cr>', 'Manual pages' },
        -- FIX: old files only in current workspace
        r = { '<cmd>Telescope oldfiles cwd_only=v:true<cr>', 'Recent files' },
        f = { '<cmd>Telescope find_files<cr>', 'Find files' },
        w = { '<cmd>Telescope live_grep<cr>', 'Find word' },
        h = { '<cmd>Telescope help_tags<cr>', 'Help tags' },
        H = { '<cmd>Telescope highlights<cr>', 'Highlights' },
        n = {
          '<cmd>Telescope notify theme=ivy initial_mode=normal previewer=false layout_config={bottom_pane={height=12}}<cr>',
          'Notifications',
        },
      },
      d = {
        name = 'Diagnostics ' .. icon('pulse'),
        w = { ':Telescope diagnostics<cr>', 'Workspace diagnostics' },
        s = { ':Lspsaga show_line_diagnostics<cr>', 'Show diagnostic line' },
        p = {
          ':Lspsaga diagnostic_jump_prev<cr>',
          'Jump to previous diagnostic line',
        },
        n = {
          ':Lspsaga diagnostic_jump_next<cr>',
          'Jump to next diagnostic line',
        },
      },
      l = {
        name = 'LSP ' .. icon('server'),
        O = { ':LSoutlineToggle<CR>', 'Toggle winbar/outline' },
        h = { ':Lspsaga hover_doc<cr>', 'Hover' },
        r = { ':Telescope lsp_references<cr>', 'References' },
        a = { ':Lspsaga code_action<cr>', 'Code action' },
        p = { ':Lspsaga peek_definition<cr>', 'Peek definition' },
        f = { ':Lspsaga lsp_finder<cr>', 'Finder' },
        R = { ':Lspsaga rename<cr>', 'Rename' },
        i = { ':Telescope lsp_implementations()<cr>', 'Implementation' },
        D = { ':lua vim.lsp.buf.declaration()<cr>', 'Declaration' },
        d = { ':Telescope lsp_definitions<cr>', 'Definition' },
        t = { ':Telescope lsp_type_definitions<cr>', 'Type definition' },
      },
      v = {
        name = 'Visit link ' .. icon('link'),
        b = { ':VisitLinkInBuffer<cr>', 'Choose from buffer' },
        u = { ':VisitLinkUnderCursor<cr>', 'Under cursor' },
        n = { ':VisitLinkNearCursor<cr>', 'Near cursor' },
      },
    },
  }, { mode = 'n' })
  wk_register({
    ['<leader>'] = {
      name = 'Plugins and features ' .. icon('rocket'),
      g = {
        name = 'GIT ' .. icon('git-branch'),
        r = { ':Gitsigns reset_hunk<cr>', 'Reset hunk' },
        s = { ':Gitsigns stage_hunk<cr>', 'Stage hunk' },
      },
    },
  }, { mode = 'v' })
  wk_register({
    ['<C-\\>'] = {
      '<Cmd>exe v:count1 . "ToggleTerm"<cr>',
      'Number of terminal ' .. icon('terminal'),
    },
  }, { mode = 't' })
  wk_register({
    ['<C-\\>'] = {
      '<Cmd>exe v:count1 . "ToggleTerm"<cr>',
      'Toggle terminal ' .. icon('terminal'),
    },
  }, { mode = 'n' })
end

local function attach_markdown(bufnr)
  wk_register({
    ['<leader>'] = {
      name = 'Plugins and features',
      P = {
        '<cmd>MarkdownPreviewToggle<cr>',
        'Toggle preview markdown ' .. icon('markdown'),
      },
    },
  }, { buffer = bufnr, mode = 'n' })
end
local function attach_python(bufnr)
  wk_register({
    ['<leader>'] = {
      name = 'Plugins and features',
      p = {
        name = 'Python ' .. icon('python'),
        r = { ':!python %<cr>', 'Run current file' },
        i = { ':lua ipython_toggle()<cr>', 'Run IPython' },
        I = {
          ':lua current_file_ipython_toggle()<cr>',
          'Run current file in IPython',
        },
        l = {
          ':ToggleTermSendCurrentLine<cr>',
          'Send current line to terminal',
        },
        f = {
          name = 'Frameworks ',
          d = {
            name = 'Django',
            r = {
              ':TermExec cmd="python manage.py runserver"<cr>',
              'Run server',
            },
          },
        },
        d = {
          name = 'DAP ' .. icon('bug'),
          b = { ':DapToggleBreakpoint<cr>', 'Toggle breakpoint' },
          r = { ':DapContinue<cr>', 'Run debug' },
          t = { ':DapTerminate<cr>', 'Terminate DAP' },
          s = {
            name = 'steps',
            O = { ':DapStepOut<cr>', 'Out' },
            o = { ':DapStepOver<cr>', 'Over' },
            i = { ':DapStepInto<cr>', 'Into' },
          },
          L = {
            name = 'Set log level',
            w = { ':DapSetLogLevel WARN<cr>', 'Warning' },
            i = { ':DapSetLogLevel INFO<cr>', 'Information' },
            d = { ':DapSetLogLevel DEBUG<cr>', 'Debug' },
            e = { ':DapSetLogLevel ERROR<cr>', 'Error' },
            t = { ':DapSetLogLevel TRACE<cr>', 'Trace' },
          },
          l = { ':DapShowLog<cr>', 'Show log' },
          R = { ':DapToggleRepl<cr>', 'Toggle REPL' },
        },
      },
    },
  }, { buffer = bufnr, mode = 'n' })
end

return {
  setup = setup,
  wk_register = wk_register,
  attach_python = attach_python,
  attach_markdown = attach_markdown,
}
