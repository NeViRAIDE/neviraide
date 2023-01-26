require('utils.nonicons')

local function if_require(module, block, errblock)
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
    ['<c-\\>'] = { ':ToggleTerm<cr>', 'Toggle terminal ' .. icon('terminal') },
    ['<c-s>'] = { ':lua save_and_format()<cr>', 'Save and format file' },
    ['<c-h>'] = {
      ':wincmd h<cr>',
      'Go to right window ' .. icon('arrow-right'),
    },
    ['<c-j>'] = { ':wincmd j<cr>', 'Go to down window ' .. icon('arrow-down') },
    ['<c-k>'] = { ':wincmd k<cr>', 'Go to up window ' .. icon('arrow-up') },
    ['<c-l>'] = { ':wincmd l<cr>', 'Go to left window ' .. icon('arrow-left') },
    ['<leader>'] = {
      name = 'Plugins and features ' .. icon('rocket'),
      b = {
        name = 'Buffers ' .. icon('versions'),
        p = { ':bprev<cr>', 'Previous' },
        n = { ':bnext<cr>', 'Next' },
        d = { ':lua close_buffer()<cr>', 'Delete' },
        D = { ':%bd | Alpha<cr>', 'Delete all buffers' },
        C = { ':%bd | e# | bd#<cr>', 'Delete buffers except current' },
        l = { '<cmd>Telescope buffers<cr>', 'List' },
      },
      c = {
        name = 'Color Picker ' .. icon('paintbrush'),
        p = { ':CccPick<cr>', 'Pick color' },
        c = { ':CccConvert<cr>', 'Conver color' },
      },
      d = {
        name = 'Diagnostics ' .. icon('pulse'),
        w = { ':Telescope diagnostics<cr>', 'Workspace diagnostics' },
        l = {
          ':lua vim.diagnostic.open_float()<cr>',
          'Show diagnostic on line',
        },
        p = {
          ':lua vim.diagnostic.goto_prev()<cr>',
          'Jump to previous diagnostic node',
        },
        n = {
          ':lua vim.diagnostic.goto_next()<cr>',
          'Jump to next diagnostic node',
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
            name = 'Set log level ' .. icon('log'),
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
      D = { ':Alpha<cr>', 'Startup screen ' .. icon('home') },
      f = {
        ':Neotree toggle<cr>',
        'File explorer ' .. icon('file-directory-open-fill'),
      },
      g = {
        name = icon('go') .. 'Lang ',
        r = { ':lua require("utils.golang").goRun()<CR>', 'Run Go programm' },
        b = {
          ':lua require("utils.golang").goBuild()<CR>',
          'Build Go programm',
        },
        T = {
          name = 'Tests',
          r = { ':!go test<CR>', 'Run tests' },
          g = {
            name = 'Generate',
            o = { ':GoTestAdd<cr>', 'One test for function/method' },
            a = { ':GoTestsAll<cr>', 'All tests for all functions/methods' },
            e = {
              ':GoTestsExp<cr>',
              'Only for exported tests for functions/methods',
            },
          },
        },
        g = { ':lua require("utils.golang").goGet()<CR>', 'Get go packages' },
        c = { ':GoCmt<cr>', 'Documentation comment' },
        i = { ':GoIfErr<cr>', 'If error template' },
        I = {
          ':lua require("utils.golang").goInterface()<cr>',
          'Interface implementation',
        },
        m = {
          name = 'Mod',
          i = { ':lua require("utils.golang").inputMod()<CR>', 'Init go.mod' },
          t = { ':GoMod tidy<CR>:LspRestart<cr>', 'Tidy go.mod' },
        },
        s = {
          name = 'Struct',
          a = { ':lua require("utils.golang").tagsAdd:mount()<cr>', 'Add tags' },
          r = {
            ':lua require("utils.golang").tagsRemove:mount()<cr>',
            'Remove tags',
          },
        },
      },
      G = {
        name = 'GIT ' .. icon('git-branch'),
        l = { ':lua lazygit_toggle()<CR>', 'Lazygit' },
        r = { ':Gitsigns reset_hunk<cr>', 'Reset hunk' },
        b = { ':Gitsigns blame_line<cr>', 'Blame line' },
        d = { ':Gitsigns diffthis<cr>', 'Diff this ' .. icon('diff') },
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
      l = {
        name = 'LSP ' .. icon('server'),
        h = { ':lua vim.lsp.buf.hover()<cr>', 'Hover' },
        s = { ':lua vim.lsp.buf.signature_help()<cr>', 'Signature help' },
        r = { ':Telescope lsp_references<cr>', 'References' },
        a = { ':lua vim.lsp.buf.code_action()<cr>', 'Code action' },
        R = { ':lua vim.lsp.buf.rename()<cr>', 'Rename' },
        D = { ':lua vim.lsp.buf.declaration()<cr>', 'Declaration' },
        d = { ':Telescope lsp_definitions<cr>', 'Definition' },
        t = { ':Telescope lsp_type_definitions<cr>', 'Type definition' },
        c = { ':lua vim.lsp.codelens.run()<cr>', 'Codelens action' },
      },
      n = {
        name = 'TODO notes ' .. icon('tasklist'),
        l = {
          ':TodoTelescope theme=ivy initial_mode=normal previewer=false layout_config={bottom_pane={height=12}}<cr>',
          'Notes list ' .. icon('tasklist'),
        },
        f = {
          'OFIX: <esc>:lua require("Comment.api").toggle.linewise.current()<cr>A',
          'FIX ' .. icon('meter'),
        },
        t = {
          'OTODO: <esc>:lua require("Comment.api").toggle.linewise.current()<cr>A',
          'TODO ' .. icon('check-circle'),
        },
        h = {
          'OHACK: <esc>:lua require("Comment.api").toggle.linewise.current()<cr>A',
          'HACK ' .. icon('flame'),
        },
        w = {
          'OWARN: <esc>:lua require("Comment.api").toggle.linewise.current()<cr>A',
          'WARN ' .. icon('alert'),
        },
        p = {
          'OPERF: <esc>:lua require("Comment.api").toggle.linewise.current()<cr>A',
          'PERF ' .. icon('stopwatch'),
        },
        n = {
          'ONOTE: <esc>:lua require("Comment.api").toggle.linewise.current()<cr>A',
          'NOTE ' .. icon('note'),
        },
      },
      N = {
        name = 'Neogen ' .. icon('comment'),
        a = { ':Neogen<cr>', 'Create annotation(autodetect)' },
        f = { ':Neogen func<cr>', 'Create function annotation' },
        c = { ':Neogen class<cr>', 'Create class annotation' },
        t = { ':Neogen type<cr>', 'Create type annotation' },
        F = { ':Neogen file<cr>', 'Create file annotation' },
      },
      s = {
        ':lua require("utils.startup").sessions:mount()<cr>',
        'Session manager ' .. icon('project'),
      },
      t = {
        name = 'Telescope ' .. icon('telescope'),
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
        s = { '<cmd>Telescope symbols<cr>', 'Symbols' },
        n = {
          '<cmd>Telescope notify theme=ivy initial_mode=normal previewer=false layout_config={bottom_pane={height=12}}<cr>',
          'Notifications',
        },
      },
      w = {
        name = 'Window size ' .. icon('browser'),
        v = { ':WindowsMaximizeVertically<cr>', 'Maximize vertically' },
        h = { ':WindowsMaximizeHorizontally<cr>', 'Maximize horizontally' },
        m = { ':WindowsMaximize<cr>', 'Fullscreen size' },
        e = { ':WindowsEqualize<cr>', 'Equalize' },
      },
    },
  }, { mode = 'n' })
  wk_register({
    ['<leader>'] = {
      name = 'Plugins and features ' .. icon('rocket'),
      l = {
        name = 'LSP ' .. icon('server'),
        a = { ':lua vim.lsp.buf.code_action()<cr>', 'Code action' },
      },
      g = {
        name = 'GIT ' .. icon('git-branch'),
        r = { ':Gitsigns reset_hunk<cr>', 'Reset hunk' },
        s = { ':Gitsigns stage_hunk<cr>', 'Stage hunk' },
      },
    },
  }, { mode = 'v' })
end

local function attach_markdown(bufnr)
  wk_register({
    ['<leader>'] = {
      name = 'Plugins and features ' .. icon('rocket'),
      P = {
        '<cmd>MarkdownPreviewToggle<cr>',
        'Toggle preview markdown ' .. icon('markdown'),
      },
    },
  }, { buffer = bufnr, mode = 'n' })
end

local function attach_jqx(bufnr)
  wk_register({
    ['<leader>'] = {
      name = 'Plugins and features ' .. icon('rocket'),
      J = {
        name = 'JQX ' .. icon('json'),
        l = { ':JqxList<cr>', 'List' },
        q = { ':JqxQuery<cr>', 'Query' },
      },
    },
  }, { buffer = bufnr, mode = 'n' })
end

-- local function attach_sql(bufnr)
--   wk_register({
--     ['<leader>'] = {
--       name = 'Plugins and features ' .. icon('rocket'),
--       S = {
--         name = 'SQL ' .. icon('database'),
--       },
--     },
--   }, { buffer = bufnr, mode = 'n' })
-- end

return {
  setup = setup,
  attach_markdown = attach_markdown,
  attach_jqx = attach_jqx,
  -- attach_sql = attach_sql,
}
