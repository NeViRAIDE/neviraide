-- TODO: golang keys
-- TODO: icons
_G.if_require = function(module, block, errblock)
  local ok, mod = pcall(require, module)
  if ok then
    return block(mod)
  elseif errblock then
    return errblock(mod)
  else
    vim.api.nvim_err_writeln('Failed to load ' .. module .. ': ' .. mod)
    return nil
  end
end

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
    ['<c-s>'] = { ':lua save_and_format()<cr>', 'Save and format file' },
    ['<c-h>'] = { ':wincmd h<cr>', 'Go to right window' },
    ['<c-j>'] = { ':wincmd j<cr>', 'Go to down window' },
    ['<c-k>'] = { ':wincmd k<cr>', 'Go to up window' },
    ['<c-l>'] = { ':wincmd l<cr>', 'Go to left window' },
    ['<leader>'] = {
      name = 'Plugins and features ',
      f = { ':Neotree toggle<cr>', 'File explorer ' },
      D = { ':Dashboard<cr>', 'Dashboard ' },
      S = { ':SessionSave<cr>', 'Save session ' },
      b = {
        name = 'Buffers ',
        p = { ':bprev<cr>', 'Previous' },
        n = { ':bnext<cr>', 'Next' },
        d = { ':lua close_buffer()<cr>', 'Delete' },
        D = { ':%bd | Dashboard<cr>', 'Delete all buffers' },
        C = { ':%bd | e# | bd#<cr>', 'Delete buffers except current' },
        l = { '<cmd>Telescope buffers<cr>', 'List' },
        w = {
          name = 'Window size',
          v = { ':WindowsMaximizeVertically<cr>', 'Maximize vertically' },
          h = { ':WindowsMaximizeHorizontally<cr>', 'Maximize horizontally' },
          m = { ':WindowsMaximize<cr>', 'Fullscreen size' },
          e = { ':WindowsEqualize<cr>', 'Equalize' },
        },
      },
      g = {
        name = 'GoLang',
        r = { ':lua goRun:mount()<CR>', 'Compile and run Go programm' },
        b = { ':lua goBuild:mount()<CR>', 'Compile packages and dependencies' },
        T = {
          name = 'Tests',
          r = { ':!go test<CR>', 'Run tests' },
          g = {
            name = 'Generate',
            o = { ':GoTestAdd<cr>', 'One test for function/method' },
            a = { ':GoTestAll<cr>', 'All tests for all functions/methods' },
            e = {
              ':GoTestExp<cr>',
              'Only for exported tests for functions/methods',
            },
          },
        },
        g = { ':lua goGet:mount()<CR>', 'Get go packages' },
        c = { ':GoCmt<cr>', 'Documentation comment' },
        i = { ':GoIfErr<cr>', 'If error template' },
        I = { ':lua goInterface:mount()<cr>', 'Interface implementation' },
        m = {
          name = 'Mod',
          i = { ':lua inputMod:mount()<CR>', 'Init go.mod' },
          t = { ':GoMod tidy<CR>:LspRestart<cr>', 'Tidy go.mod' },
        },
        t = {
          name = 'Tags',
          a = { ':lua tagsAdd:mount()<cr>', 'Add tags' },
          r = { ':lua tagsRemove:mount()<cr>', 'Remove tags' },
        },
      },
      G = {
        name = 'GIT ',
        -- TODO: function for lazygit
        l = { ':TermExec direction=float cmd=lazygit<CR>', 'Lazygit' },
        r = { ':Gitsigns reset_hunk<cr>', 'Reset hunk' },
        b = { ':Gitsigns blame_line<cr>', 'Blame line' },
        d = { ':Gitsigns diffthis<cr>', 'Diff this' },
        n = { ':Gitsigns next_hunk<cr>', 'Go to next hunk' },
        p = { ':Gitsigns prev_hunk<cr>', 'Go to previous hunk' },
        P = { ':Gitsigns preview_hunk<cr>', 'Preview hunk' },
        t = {
          name = 'Toggle',
          l = { ':Gitsigns toggle_linehl<CR>', 'Line highlighting' },
          n = { ':Gitsigns toggle_numhl<CR>', 'Line numbers highlighting' },
          s = { ':Gitsigns toggle_signs<CR>', 'Signs' },
          w = { ':Gitsigns toggle_word_diff<CR>', 'Word diff' },
          d = { ':Gitsigns toggle_deleted<CR>', 'Deleted' },
          b = {
            ':Gitsigns toggle_current_line_blame<CR>',
            'Current line blame',
          },
        },
      },
      w = {
        name = 'Window size',
        v = { ':WindowsMaximizeVertically<cr>', 'Maximize vertically' },
        h = { ':WindowsMaximizeHorizontally<cr>', 'Maximize horizontally' },
        m = { ':WindowsMaximize<cr>', 'Fullscreen size' },
        e = { ':WindowsEqualize<cr>', 'Equalize' },
      },
      N = {
        name = 'Neogen ',
        a = { ':Neogen<cr>', 'Create annotation(autodetect)' },
        f = { ':Neogen func<cr>', 'Create function annotation' },
        c = { ':Neogen class<cr>', 'Create class annotation' },
        t = { ':Neogen type<cr>', 'Create type annotation' },
        F = { ':Neogen file<cr>', 'Create file annotation' },
      },
      c = {
        name = 'Color Picker ',
        p = { ':CccPick<cr>', 'Pick color' },
        c = { ':CccConvert<cr>', 'Conver color' },
      },
      n = {
        name = 'Notes ',
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
      T = { ':ToggleTerm<cr>', 'Temrinal' },
      t = {
        name = 'Telescope ',
        a = { '<cmd>Telescope autocommands<cr>', 'Autocommands' },
        m = { '<cmd>Telescope man_pages<cr>', 'Manual pages' },
        r = {
          '<cmd>Telescope oldfiles cwd_only=v:true<cr>',
          'Recent files in current directory',
        },
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
        name = 'Diagnostics ',
        w = { ':Telescope diagnostics<cr>', 'Workspace diagnostics' },
        l = { ':lua vim.diagnostic.open_float()<cr>', 'Show diagnostic line' },

        p = {
          ':lua vim.diagnostic.goto_prev()<cr>',
          'Jump to previous diagnostic line',
        },
        n = {
          ':lua vim.diagnostic.goto_next()<cr>',
          'Jump to next diagnostic line',
        },
        d = {
          name = 'DAP',
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
      l = {
        name = 'LSP ',
        h = { ':lua vim.lsp.buf.hover()<cr>', 'Hover' },
        r = { ':Telescope lsp_references<cr>', 'References' },
        a = { ':lua vim.lsp.buf.code_action()<cr>', 'Code action' },
        R = { ':lua vim.lsp.buf.rename()<cr>', 'Rename' },
        D = { ':lua vim.lsp.buf.declaration()<cr>', 'Declaration' },
        d = { ':Telescope lsp_definitions<cr>', 'Definition' },
        t = { ':Telescope lsp_type_definitions<cr>', 'Type definition' },
      },
    },
  }, { mode = 'n' })
  wk_register({
    ['<leader>'] = {
      name = 'Plugins and features ',
      g = {
        name = 'GIT ',
        r = { ':Gitsigns reset_hunk<cr>', 'Reset hunk' },
        s = { ':Gitsigns stage_hunk<cr>', 'Stage hunk' },
      },
    },
  }, { mode = 'v' })
end

local function attach_markdown(bufnr)
  wk_register({
    ['<leader>'] = {
      name = 'Plugins and features ',
      P = {
        '<cmd>MarkdownPreviewToggle<cr>',
        'Toggle preview markdown ',
      },
    },
  }, { buffer = bufnr, mode = 'n' })
end

return {
  setup = setup,
  wk_register = wk_register,
  attach_markdown = attach_markdown,
}
