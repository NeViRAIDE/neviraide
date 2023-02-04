return {
  name = icon('go', 'Go', 'Go') .. 'Lang ',
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
}
