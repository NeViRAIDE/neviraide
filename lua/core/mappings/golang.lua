return function(bufnr)
  require('core.utils').wk_reg({
    ['<leader>'] = {
      g = {
        name = 'GoLang ',
        c = { ':GoCmt<cr>', 'Comment' },
        d = { ':GoDoc<cr>', 'Documentation' },
        m = {
          name = "Mod",
          i = { ':GoModInit<cr>', 'Init' },
          t = { ':GoModTidy<cr>', 'Tidy' },
          v = { ':GoModVendor<cr>', 'Vendor' },
        },
        t = {
          name = "Tags",
          a = { ':GoAddTag<cr>', 'Add' },
          r = { ':GoRmTag<cr>', 'Remove' },
          c = { ':GoClearTag<cr>', 'Clear' },
        },
        D = {
          name = "Debug",
          b = { ':GoBreakToggle<cr>', 'Toggle breakpoint' },
          d = { ':GoDebug<cr>', 'Debug' },
          S = { ':GoDbdStop<cr>', 'STOP Debug' },
        },
        f = {
          name = "Autofill",
          i = { ':GoIfErr<cr>', 'Add if err' },
          s = { ':GoFillStruct<cr>', 'Fill struct' },
          S = { ':GoFillSwitch<cr>', 'Fill switch' },
          f = { ':GoFixPlurals<cr>', 'change func foo(b int, a int, r int) -> func foo(b, a, r int)' },
        },
      }
    },
  }, { buffer = bufnr, mode = 'n' })
end
