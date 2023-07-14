local on_attach = require("config.lsp.on_attach")
local capabilities = require("config.lsp.capabilites")

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
  signs = false,
  underline = true,
  update_in_insert = false,
  virtual_text = false,
  severity_sort = true,
})

vim.lsp.handlers["workspace/diagnostic/refresh"] = function(_, _, ctx)
  local ns = vim.lsp.diagnostic.get_namespace(ctx.client_id)
  pcall(vim.diagnostic.reset, ns)
  return true
end

return {
  "ray-x/go.nvim",
  ft = { "go", 'gomod' },
  dependencies = {
    "ray-x/guihua.lua",

    'mfussenegger/nvim-dap',
    'rcarriga/nvim-dap-ui',
    { 'theHamsta/nvim-dap-virtual-text', config = true },
    { 'leoluz/nvim-dap-go',              config = true },
  },
  -- event = { "CmdlineEnter" },
  build = ':lua require("go.install").update_all_sync()',

  config = function()
    require('go').setup({
      goimport = 'gopls',          -- goimport command, can be gopls[default] or goimport
      gofmt = 'gopls',             --gofmt cmd,
      max_line_len = 60,           -- max line length in goline format
      tag_transform = false,       -- tag_transfer  check gomodifytags for details
      test_template = '',          -- default to testify if not set; g:go_nvim_tests_template  check gotests for details
      test_template_dir = '',      -- default to nil if not set; g:go_nvim_tests_template_dir  check gotests for details
      comment_placeholder = '...', -- comment_placeholder your cool placeholder e.g.      
      icons = { breakpoint = '🛑', currentpos = '🏃' },
      lsp_cfg = {
        capabilities = capabilities,
        flags = { debounce_text_changes = 150 },
        single_file_support = true,
        settings = {
          gopls = {
            experimentalPostfixCompletions = true,
            analyses = {
              unusedparams = true,
              shadow = true,
            },
            staticcheck = true,
            usePlaceholders = false,
            codelenses = {
              references = true,
              genrate = true,
              gc_details = true,
            },
            -- hints = {
            --   assignVariableTypes = true,
            --   compositeLiteralFields = true,
            --   compositeLiteralTypes = true,
            --   constantValues = true,
            --   functionTypeParameters = true,
            --   parameterNames = true,
            --   rangeVariableTypes = true,
            -- },
          },
        },
      },                         -- true: apply go.nvim non-default gopls setup, if it is a list, will merge with gopls setup e.g.
      -- lsp_cfg = {settings={gopls={matcher='CaseInsensitive', ['local'] = 'your_local_module_path', gofumpt = true }}}
      lsp_gofumpt = true,        -- true: set default gofmt in gopls format to gofumpt
      lsp_on_attach = on_attach, -- if a on_attach function provided:  attach on_attach function to gopls
      -- true: will use go.nvim on_attach if true
      -- nil/false do nothing
      lsp_codelens = true,  -- set to false to disable codelens, true by default
      lsp_diag_hdlr = true, -- hook lsp diag handler
      lsp_diag_underline = true,
      lsp_diag_update_in_insert = false,
      -- virtual text setup
      lsp_diag_virtual_text = false,
      lsp_diag_signs = true,

      lsp_inlay_hints = {
        enable = true,
        only_current_line = true,
        show_variable_name = true,
        parameter_hints_prefix = " ",
        show_parameter_hints = true,
        other_hints_prefix = "=> ",
        max_len_align = false,
        max_len_align_padding = 1,
        right_align = false,
        right_align_padding = 6,
        highlight = "Comment",
      },

      gopls_remote_auto = true, -- add -remote=auto to gopls
      gopls_cmd = nil,          -- if you need to specify gopls path and cmd, e.g {"/home/user/lsp/gopls", "-logfile","/var/log/gopls.log" }
      fillstruct = 'gopls',     -- can be nil (use fillstruct, slower) and gopls

      dap_debug = true,         -- set to false to disable dap
      --float term recommand if you use richgo/ginkgo with terminal color
      dap_debug_keymap = true,  -- set keymaps for debugger
      dap_debug_gui = true,     -- set to tru to enable dap gui, highly recommand
      dap_debug_vt = true,      -- set to true to enable dap virtual text
      dap_retries = 20,
      dap_timeout = 15,         --  see dap option initialize_timeout_sec = 15,
      dap_port = 38697,


      run_in_floaterm = true, -- set to true to run in float window.
      textobjects = true,     -- enable default text jobects through treesittter-text-objects
      test_runner = 'go',     -- richgo, go test, richgo, dlv, ginkgo
      build_tags = "",        -- set default build tags
      luasnip = true,         -- enable included luasnip snippets. you can also disable while add lua/snips folder to luasnip load
    })
  end,
}
