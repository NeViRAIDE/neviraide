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
          a = { ':GoTagAdd<cr>', 'Add' },
          r = { ':GoTagRm<cr>', 'Remove' },
          c = { ':GoTagClear<cr>', 'Clear' },
        },
        D = {
          name = "Debug",
          b = { ':GoBreakToggle<cr>', 'Toggle breakpoint' },
          d = { ':GoDebug<cr>', 'Debug' },
          S = { ':GoDbdStop<cr>', 'STOP Debug' },
        },
        i = { ':GoIfErr<cr>', 'Add if err' },
      }
    },
  }, { buffer = bufnr, mode = 'n' })
end
