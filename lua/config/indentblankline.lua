return {
  -- remove_blankline_trail = true,
  indent = {
    highlight = {
      'IndentBlanklineChar',
    },
  },
  exclude = {
    filetypes = {
      'help',
      'terminal',
      'lazy',
      'lspinfo',
      'TelescopePrompt',
      'TelescopeResults',
      'mason',
      'noice',
    },
  },
  scope = {
    include = {
      node_type = { ['*'] = { 'return_statement', 'table_constructor' } },
    },
    exclude = {
      node_type = {
        ['*'] = { 'source_file', 'program' },
        lua = { 'chunk' },
        python = { 'module' },
      },
    },
    highlight = {
      'IndentBlanklineIndent1',
      'IndentBlanklineIndent2',
      'IndentBlanklineIndent3',
      'IndentBlanklineIndent4',
      'IndentBlanklineIndent5',
      'IndentBlanklineIndent6',
    },
  },
}
